const express = require("express");
const User = require("./models/User");
const app = express();

app.listen(8081, () => {
  console.log("server started at 8081");
});

app.get('api/users/auth', auth, (req,res) => {
  res.status(200).json({
    id: req.user.id,
    nickname: req.user.nickname,
  })
})

app.get('/api/users/logout', auth, (req,res) => {
  User.findOneAndUpdate({kd: req.user.id}, {token: ""}, (err, user) => {
    if(err) return res.json({success: false, err});
    return res.status(200).send({
      success: true
    })
  })
})