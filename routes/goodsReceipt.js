const express = require('express')
const router = express.Router()

router.get("/", (req, res) => {
  // download goods issue
  res.send("Goods receipt router ready")
})

router.post("/", (req, res) => {
  // input goods receipt
})

module.exports = router