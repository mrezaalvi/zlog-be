const express = require('express')
const { PrismaClient } = require("@prisma/client")
const { body } = require('express-validator')

const router = express.Router()
const prisma = new PrismaClient()

router.get("/", async (req, res) => {
  const projects = await prisma.project.findMany({
    include: {
      picProject: {}
    }
  })

  res.send(projects)
})

router.get("/:id", async (req, res) => {
  const projects = await prisma.project.findUnique({
    where: {
      id: parseInt(req.params.id)
    }
  })

  res.send(projects)
})

router.post("/", body(["nama", "lokasi", "emailAcc1", "emailAcc2", "emailAccFinal"]).escape(), async (req, res) => {
  const { kode, nama, lokasi, emailAcc1, emailAcc2, emailAccFinal } = req.body
  const userAcc1 = await prisma.user.findUnique({
    where: {
      email: emailAcc1
    }
  })

  const userAcc2 = await prisma.user.findUnique({
    where: {
      email: emailAcc2
    }
  })
  const userAccFinal = await prisma.user.findUnique({
    where: {
      email: emailAccFinal
    }
  })

  const sppAcc1Id = userAcc1.id
  const sppAcc2Id = userAcc2.id
  const sppAccFinalId = userAccFinal.id

  const project = await prisma.project.create({
    data: {
      kode,
      nama,
      lokasi,
      sppAcc1Id,
      sppAcc2Id,
      sppAccFinalId
    }
  })

  res.send(project);
})

router.post("/pic", body(["emailPM", "emailSEM", "emailPOP", "emailLogistik", "emailPenbar", "emailSOM", "emailGSP", "emailSP", "emailARK", "emailQCO", "emailHSEO", "emailSAK", "emailSE"]), async (req, res) => {
  const { projectId, emailPM, emailSEM, emailPOP, emailLogistik, emailPenbar, emailSOM, emailGSP, emailSP, emailARK, emailQCO, emailHSEO, emailSAK, emailSE } = req.body

  const PM = await prisma.user.findUnique({
    where: {
      email: emailPM
    }
  })
  const SEM = await prisma.user.findUnique({
    where: {
      email: emailSEM
    }
  })
  const POP = await prisma.user.findUnique({
    where: {
      email: emailPOP
    }
  })
  const Logistik = await prisma.user.findUnique({
    where: {
      email: emailLogistik
    }
  })
  const Penbar = await prisma.user.findUnique({
    where: {
      email: emailPenbar
    }
  })
  const SOM = await prisma.user.findUnique({
    where: {
      email: emailSOM
    }
  })
  const GSP = await prisma.user.findUnique({
    where: {
      email: emailGSP
    }
  })
  const SP = await prisma.user.findUnique({
    where: {
      email: emailSP
    }
  })
  const ARK = await prisma.user.findUnique({
    where: {
      email: emailARK
    }
  })
  const QCO = await prisma.user.findUnique({
    where: {
      email: emailQCO
    }
  })
  const HSEO = await prisma.user.findUnique({
    where: {
      email: emailHSEO
    }
  })
  const SAK = await prisma.user.findUnique({
    where: {
      email: emailSAK
    }
  })
  const SE = await prisma.user.findUnique({
    where: {
      email: emailSE
    }
  })

  const picProject = await prisma.picProject.createMany({
    data: [
      {projectId, userId: PM.id},
      {projectId, userId: SEM.id},
      {projectId, userId: POP.id},
      {projectId, userId: Logistik.id},
      {projectId, userId: Penbar.id},
      {projectId, userId: SOM.id},
      {projectId, userId: GSP.id},
      {projectId, userId: SP.id},
      {projectId, userId: ARK.id},
      {projectId, userId: QCO.id},
      {projectId, userId: HSEO.id},
      {projectId, userId: SAK.id},
      {projectId, userId: SE.id}
    ]
  })

  res.send(picProject)
})

module.exports = router 