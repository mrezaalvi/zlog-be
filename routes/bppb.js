const express = require("express");
const { PrismaClient } = require("@prisma/client");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", (req, res) => {});

router.post("/", async (req, res) => {
  const { jabatan, id, projectId } = req.userData
  const { kode, materialsData } = req.body
  if (jabatan == "PM" || jabatan == "SEM") {
    return res.send("PM dan SEM tidak bisa membuat BPPB")
  }

  const dataBppb = await prisma.bppb.create({
    data: {
      projectId,
      kode,
      createdByUserId: id,
    }
  })

  materialsData.forEach(async data => {
    await prisma.detailBppb.create({
      data: {
        bppbId: dataBppb.id,
        material: data["material"],
        spesifikasi: data["spesifikasi"],
        volume: data["volume"],
        satuan: data["satuan"],
        lokasi: data["lokasi"],
        namaPekerja: data["namaPekerja"]
      }
    })
  });

  res.send(dataBppb)
})

router.post("/acc", async (req, res) => {
  const { id, projectId } = req.userData
  const { approvalStatus, dataBppbId } = req.body
  
  const project = await prisma.project.findUnique({
    where: {
      id: projectId
    }
  })

  const dataBppb = await prisma.bppb.findUnique({
    where: {
      id: dataBppbId
    }
  })

  const acc2Status = dataBppb.acc2Status
  const acc1Status = dataBppb.acc1Status

  const userAcc1 = await prisma.user.findUnique({
    where: {
      id: project.sppAcc1Id
    }
  })
  const userAcc2 = await prisma.user.findUnique({
    where: {
      id: project.sppAcc2Id
    }
  })
  const userAccFinal = await prisma.user.findUnique({
    where: {
      id: project.sppAccFinalId
    }
  })

  if (id == userAcc2.id) {
    const acc2 = await prisma.bppb.update({
      where: {
        id: dataBppbId
      },
      data: {
        acc2Status: approvalStatus
      }
    })

    res.send(acc2)
  } else if (id == userAcc1.id && acc2Status == "APPROVED") {
    const acc1 = await prisma.bppb.update({
      where: {
        id: dataBppbId
      },
      data: {
        acc1Status: approvalStatus
      }
    })

    res.send(acc1)
  } else if (id == userAccFinal.id && acc1Status == "APPROVED") {
    await prisma.bppb.update({
      where: {
        id: dataBppbId
      },
      data: {
        accFinalStatus: approvalStatus,
        sppStatus: approvalStatus == "APPROVED" ? "APPROVED" : "NOT_APPROVED"
      }
    })

    res.send(dataBppb)
  } else {
    res.send("Nothing to see here")
  }
})

module.exports = router;
