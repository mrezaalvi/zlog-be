const express = require('express')
const { PrismaClient } = require("@prisma/client")
const { body } = require("express-validator")

const router = express.Router()
const prisma = new PrismaClient()

router.get("/", async (req, res) => {
  const { id, projectId } = req.userData
  const project = await prisma.project.findUnique({
    where: {
      id: projectId
    }
  })
  
  const sppNoAcc2 = await prisma.dataSpp.findMany({
    where: {
      acc2Status: "WAITING"
    }
  })
  const sppNoAcc1 = await prisma.dataSpp.findMany({
    where: {
      acc2Status: "APPROVED" || "NOT_APPROVED",
      acc1Status: "WAITING"
    }
  })
  const sppNoAccFinal = await prisma.dataSpp.findMany({
    where: {
      acc2Status: "APPROVED" || "NOT_APPROVED",
      acc1Status: "APPROVED" || "NOT_APPROVED",
      accFinalStatus: "WAITING"
    }
  })

  let listSpp = []

  if (id == project.sppAcc2Id) {
    return res.send(sppNoAcc2)
  } else if (id == project.sppAcc1Id) {
    return res.send(sppNoAcc1)
  } else if (id == project.sppAccFinalId) {
    return res.send(sppNoAccFinal)
  } else {
    return res.send([])
  }
  
})

router.get("/:sppId", async (req,res) => {
  const spp = await prisma.dataSpp.findUnique({
    where: {
      id: parseInt(req.params.sppId)
    }
  })

  res.send(spp)
})

router.get("/detail/:sppId", async (req,res) => {
  const detailSpp = await prisma.detailSpp.findMany({
    where: {
      dataSppId: parseInt(req.params.sppId)
    }
  })

  res.send(detailSpp)
})

router.post("/", body("kode").escape(), async (req, res) => {
  const { jabatan, id, projectId } = req.userData
  const { kode } = req.body
  if (jabatan == "PM" || jabatan == "SEM") {
    return res.send("PM dan SEM tidak bisa membuat SPP")
  }

  // upload to DataSPP
  const dataSpp = await prisma.dataSpp.create({
    data: {
      projectId,
      kode,
      createdByUserId: id,
    }
  })

  // receives array of objects [{}, {}, ..]
  const data = req.body.data
  data.forEach(async data => {
    await prisma.detailSpp.create({
      data: {
        material: data["material"],
        spesifikasi: data["spesifikasi"],
        volume: data["volume"],
        satuan: data["satuan"],
        lokasi: data["lokasi"],
        dataSppId: dataSpp.id
      }
    })
  });

  res.send(dataSpp);
})

router.post("/acc", body(["approvalStatus, dataSppId"]).escape(), async (req, res) => {
  const { id, projectId } = req.userData
  const { approvalStatus, dataSppId } = req.body
  
  const project = await prisma.project.findUnique({
    where: {
      id: projectId
    }
  })

  const dataSpp = await prisma.dataSpp.findUnique({
    where: {
      id: dataSppId
    }
  })

  const acc2Status = dataSpp.acc2Status
  const acc1Status = dataSpp.acc1Status

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
    const acc2 = await prisma.dataSpp.update({
      where: {
        id: dataSppId
      },
      data: {
        acc2Status: approvalStatus,
        sppStatus: approvalStatus == "NOT_APPROVED" ? "NOT_APPROVED" : "WAITING"
      }
    })

    res.send(acc2)
  } else if (id == userAcc1.id && acc2Status == "APPROVED") {
    const acc1 = await prisma.dataSpp.update({
      where: {
        id: dataSppId
      },
      data: {
        acc1Status: approvalStatus,
        sppStatus: approvalStatus == "NOT_APPROVED" ? "NOT_APPROVED" : "WAITING"
      }
    })

    res.send(acc1)
  } else if (id == userAccFinal.id && acc1Status == "APPROVED") {
    await prisma.dataSpp.update({
      where: {
        id: dataSppId
      },
      data: {
        accFinalStatus: approvalStatus,
        sppStatus: approvalStatus == "APPROVED" ? "APPROVED" : "NOT_APPROVED"
      }
    })

    res.send(dataSpp)
  } else {
    res.send("Nothing to see here")
  }
})

module.exports = router