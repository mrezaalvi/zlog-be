const express = require('express')
const router = express.Router()

router.get("/", (req, res) => {
  res.send("Stock material router ready")
})

module.exports = router