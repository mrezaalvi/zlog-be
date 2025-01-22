const express = require("express");
const { PrismaClient } = require("@prisma/client");
const { body } = require("express-validator");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", async (req, res) => {
  const goodsReceipt = await prisma.goodsReceipt.findMany();
  res.send(goodsReceipt);
});

router.get("/latest", async (req, res) => {
  const goodsReceipt = await prisma.goodsReceipt.findFirst({
    orderBy: {
      id: "desc"
    },
    take: 1
  });

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
  body([
    "vendor",
    "namaPengantar",
  ]).escape(),
  async (req, res) => {
    const { jabatan } = req.userData;
    const {
      noMaterialMasuk,
      noSuratJalan,
      tanggalMasuk,
      vendor,
      namaPengantar,
      data,
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

      data.forEach(async data => {
        await prisma.goodsReceiptDetail.create({
          data: {
            goodsReceiptId: goodsReceipt.id,
            material: data["material"],
            spesifikasi: data["spesifikasi"],
            volume: parseInt(data["volume"]),
            satuan: data["satuan"]
          }
        })
      })
      
      return res.send(goodsReceipt);
    }

    res.send("forbidden");
  }
);

module.exports = router;
