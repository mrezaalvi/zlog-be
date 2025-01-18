const express = require("express");
const { PrismaClient } = require("@prisma/client");
const { body } = require("express-validator");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", async (req, res) => {
  const goodsReceipt = await prisma.goodsReceipt.findMany();
  res.send(goodsReceipt);
});

router.get("/:goodsReceiptId", async (req, res) => {
  const goodsReceipt = await prisma.goodsReceipt.findUnique({
    where: {
      id: parseInt(req.params.goodsReceiptId),
    },
    include: {
      goodsReceiptDetail: {},
    },
  });

  res.send(goodsReceipt);
});

router.post(
  "/",
  body(["noSuratJalan", "tanggalMasuk", "vendor", "namaPengantar"]).escape(),
  async (req, res) => {
    const { jabatan } = req.userData;
    const {
      noMaterialMasuk,
      noSuratJalan,
      tanggalMasuk,
      vendor,
      namaPengantar,
    } = req.body;

    if (jabatan == "POP" || jabatan == "LOGISTIK" || jabatan == "PENBAR") {
      const goodsReceipt = await prisma.goodsReceipt.create({
        data: {
          noMaterialMasuk,
          noSuratJalan,
          tanggalMasuk,
          vendor,
          namaPengantar,
        },
      });

      return res.send(goodsReceipt);
    }

    res.send("forbidden");
  }
);

router.post("/detail", async (req, res) => {
  const { data, goodsReceiptId } = req.body
  const { jabatan } = req.userData

  if (jabatan == "POP" || jabatan == "LOGISTIK" || jabatan == "PENBAR") {
    data.forEach(async d => {
      await prisma.goodsReceiptDetail.create({
        data: {
          goodsReceiptId,
          material: d["material"],
          spesifikasi: d["spesifikasi"],
          volume: d["volume"],
          satuan: d["satuan"],
        },
      });
    })
  }
})

module.exports = router;
