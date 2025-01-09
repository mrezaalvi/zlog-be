const express = require('express')
const router = express.Router()

router.get("/bppb", (req, res) => {
  // lihat bppb goods issue
  res.send("Goods issue router ready")
})

router.post("/bppb", (req, res) => {
  // input bppb goods issue
})

router.post("/material-keluar", (req, res) => {
  // input material keluar goods issue
})

module.exports = router