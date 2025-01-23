const express = require("express");
const { PrismaClient } = require("@prisma/client");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", async (req, res) => {
  const { projectId } = req.userData;
  const material = await prisma.material.findMany({
    where: {
      projectId,
    },
  });

  res.send(material);
});

router.post("/", async (req, res) => {
  const { projectId } = req.userData;
  const { data } = req.body;

  const materialArr = [];
  data.forEach(async (d) => {
    const material = await prisma.material.create({
      data: {
        nama: d.material.toUpperCase(),
        spesifikasi: d.spesifikasi.toUpperCase(),
        volume: d.volume,
        satuan: d.satuan.toUpperCase(),
        projectId,
      },
    });

    materialArr.push(material);
  });

  res.send(materialArr);
});

module.exports = router;
