const express = require('express')
const { PrismaClient } = require("@prisma/client")

const router = express.Router()
const prisma = new PrismaClient()

router.get("/", (req, res) => {

})

router.post("/", async (req, res) => {
  const { jabatan, id, projectId } = req.userData
  if (jabatan == "PM" || jabatan == "SEM") {
    return res.send("PM dan SEM tidak bisa membuat SPP")
  }

  // receives array of objects [{}, {}, ..]
  const data = req.body.data;

  const dataSpp = await prisma.dataSpp.create({
    data: {
      projectId,
      kode: "SPP Nomor 1",
      createdByUserId: id
    }
  })

  res.send(dataSpp)
})

module.exports = router