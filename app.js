const express = require("express");
const cors = require("cors");

const { router: userRouter, accessValidation } = require("./routes/user.js");
const sppRouter = require("./routes/spp.js");
const goodsReceiptRouter = require("./routes/goodsReceipt.js");
const goodsIssueRouter = require("./routes/goodsIssue.js");
const materialRouter = require("./routes/material.js");
const projectRouter = require("./routes/project.js");

const app = express();

app.use("/public", express.static("public"));
app.use(express.json());
app.use(cors());
app.use("/user", userRouter);
app.use("/spp", accessValidation, sppRouter);
app.use("/goods-receipt", accessValidation, goodsReceiptRouter);
app.use("/goods-issue", goodsIssueRouter);
app.use("/material", accessValidation, materialRouter);
app.use("/project", accessValidation, projectRouter);

app.get("/", (req, res) => {
  res.send("hello zlog");
});

app.listen(3000);
