const express = require('express')

const {router: userRouter, accessValidation} = require('./routes/user.js')
const sppRouter = require('./routes/spp.js')

const app = express()

app.use(express.json())
app.use("/user", userRouter)
app.use("/spp", accessValidation, sppRouter)

app.get("/", (req, res) => {
  res.send("hello zlog")
})

app.listen(3000)