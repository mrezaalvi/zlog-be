const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  // lihat semua permintaan spp (bisa juga download single atau all)
  res.send("spp router ready");
});

router.post("/input", (req, res) => {
  // input permintaan spp
});

router.post("/approval", (req, res) => {
  // approve or not approve
});

module.exports = router;
