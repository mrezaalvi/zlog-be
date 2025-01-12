const express = require("express");
const { PrismaClient } = require("@prisma/client");

const router = express.Router();
const prisma = new PrismaClient();

router.get("/", async (req, res) => {
  const goodsIssue = await prisma.bppb.findMany()
  res.send(goodsIssue)
});

module.exports = router;
