const express = require('express')
const bcrypt = require('bcrypt')
const { PrismaClient } = require("@prisma/client")
const { body } = require('express-validator')

const router = express.Router()
const prisma = new PrismaClient()

router.get("/", (req, res) => {
  res.send("user router ready")
})

router.post("/register", body(["nama", "nomorHp", "email", "password", "jabatan"]).escape(), async (req, res) => {
  // register akun pekerja
  const nama = req.body.nama
  const nomorHp = req.body.nomorHp
  const email = req.body.email
  const password = req.body.password
  const jabatan = req.body.jabatan

  const salt = await bcrypt.genSalt()
  const hashedPassword = await bcrypt.hash(password, salt)
  const user = await prisma.user.create({
    data: {
      nama,
      nomorHp,
      email,
      password: hashedPassword,
      jabatan
    }
  })

  res.send(user)
})

router.post("/login", body(["email", "password"]).escape(), async (req, res) => {
  // login akun pekerja
  const email = req.body.email
  const password = req.body.password

  const user = await prisma.user.findUnique({
    where: {
      email
    }
  })

  const isEmailCorrect = email == user.email
  const isPasswordCorrect = await bcrypt.compare(password, user.password)

  if (isEmailCorrect && isPasswordCorrect) {
    // send jwt here
    res.send("login successful " + email + " " + password);
  } else {
    res.send("login failed")
  }
})

module.exports = router