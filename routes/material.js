const express = require("express");
const { PrismaClient } = require("@prisma/client");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", async (req, res) => {
  const material = await prisma.dataMaterial.findMany({
    include: {
      materialDetail: {},
    },
  });

  res.send(material);
});

router.post("/", async (req, res) => {
  const { projectId } = req.userData;
  const { data } = req.body;

  const material = await prisma.dataMaterial.create({
    data: {
      projectId,
    },
  });

  data.forEach(async (d) => {
    await prisma.materialDetail.create({
      data: {
        nama: d.material,
        spesifikasi: d.spesifikasi,
        volume: d.volume,
        satuan: d.satuan,
        dataMaterialId: material.id,
      },
    });
  });

  res.send(material);
});

module.exports = router;
