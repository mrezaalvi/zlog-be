const express = require("express");
const { PrismaClient } = require("@prisma/client");
const { body } = require("express-validator")

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", async (req, res) => {
  const goodsIssue = await prisma.bppb.findMany()
  res.send(goodsIssue)
});

router.get("/:bppbId", async (req, res) => {
  const goodsIssue = await prisma.bppb.findUnique({
    where: {
      id: parseInt(req.params.bppbId)
    },
    include: {
      detailBppb: {}
    }
  })

  res.send(goodsIssue)
})

router.post("/bppb", body(["kode", "namaPekerja", "lokasi"]).escape(), async (req, res) => {
  const { jabatan, id, projectId } = req.userData
  const { kode, materialsData, namaPekerja } = req.body
  if (jabatan == "PM" || jabatan == "SEM") {
    return res.send("PM dan SEM tidak bisa membuat BPPB")
  }

  const dataBppb = await prisma.bppb.create({
    data: {
      projectId,
      kode,
      namaPekerja,
      createdByUserId: id,
    }
  })

  materialsData.forEach(async data => {
    await prisma.detailBppb.create({
      data: {
        bppbId: dataBppb.id,
        material: data["material"],
        spesifikasi: data["spesifikasi"],
        volume: parseInt(data["volume"]),
        satuan: data["satuan"],
        lokasi: data["lokasi"],
      }
    })
  });

  res.send(dataBppb)
})

router.post("/bppb/acc", body(["approvalStatus"]).escape(), async (req, res) => {
  const { jabatan } = req.userData
  const { approvalStatus, dataBppbId } = req.body

  if (jabatan == "LOGISTIK" || jabatan == "PENBAR") {
    const acc = await prisma.bppb.update({
      where: {
        id: dataBppbId
      },
      data: {
        accStatus: approvalStatus
      }
    })

    res.send(acc)
  }
})

module.exports = router;
