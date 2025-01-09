const express = require('express')

const userRouter = require('./routes/user.js')
const sppRouter = require('./routes/spp.js')
const goodsReceiptRouter = require('./routes/goodsReceipt.js')
const goodsIssueRouter = require('./routes/goodsIssue.js')
const stockMaterialRouter = require('./routes/stockMaterial.js')

const app = express()

app.use(express.json())
app.use("/user", userRouter)
app.use("/spp", sppRouter)
app.use("/goods-receipt", goodsReceiptRouter)
app.use("/goods-issue", goodsIssueRouter)
app.use("/stock-material", stockMaterialRouter)

app.get("/", (req, res) => {
  res.send("hello zlog")
})

app.listen(3000)