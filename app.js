const express = require('express')

const {router: userRouter, accessValidation} = require('./routes/user.js')
const sppRouter = require('./routes/spp.js')
const goodsReceiptRouter = require('./routes/goodsReceipt.js')
const bppbRouter = require('./routes/bppb')

const app = express()

app.use(express.json())
app.use("/user", userRouter)
app.use("/spp", accessValidation, sppRouter)
app.use("/goods-receipt", accessValidation, goodsReceiptRouter)
app.use("/bppb", accessValidation, bppbRouter)

app.get("/", (req, res) => {
  res.send("hello zlog")
})

app.listen(3000)