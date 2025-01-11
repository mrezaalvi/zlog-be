const express = require("express");
const { PrismaClient } = require("@prisma/client");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", (req, res) => {});

router.post("/", async (req, res) => {
  const { jabatan } = req.userData;
  const {
    noMaterialMasuk,
    noSuratJalan,
    tanggalMasuk,
    vendor,
    namaPengantar,
    materialsData
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

    materialsData.forEach(async data => {
      await prisma.goodsReceiptDetail.create({
        data: {
          goodsReceiptId: goodsReceipt.id,
          material: data["material"],
          spesifikasi: data["spesifikasi"],
          volume: data["volume"],
          satuan: data["satuan"]
        }
      })
    })

    return res.send("added")
  }

  res.send("forbidden")
});

module.exports = router;
