const mongoose= require("mongoose");

const UserSchema = new mongoose.Schema({
    id: {
        type: String,
        unique: true
    },
    nickname: {
        type: String,
        required: true
    },
    passward: {
        type: String,
        required: true
    }
})

const cookieParser= require('cookie-parser');

app.use(cookieParser());

app.post('/api/Users/login', (req, res) => {
    User.findOne({id: req.body.id}, (err,user) =>{
        if(!user) {
            return res.json({
                loginSuccess: false,
                message: "제공된 id에 해당하는 유저가 없습니다."
            })
        }
    
        user.comparePassword(req.body.password, (err, isMatch) => {
            if(!isMatch)
                return res.json({loginSuccess: false, message: "비밀번호가 틀렸습니다."
            })

            user.generateToken((err, user) => {
                if(err) return res.status(400).send(err);

                res.cookie("x_auth", user.token)
                .status(200)
                .json({loginSuccess: true, userID: user})
            })
        })

    })
})

userSchema.methods.comparePassword = function(plainPassword, cb) {
    bcrypt.compare(plainPassword, this.password, function(err, isMatch) {
        if(err) return cb(err)
        cb(null, isMatch)
    })
}

userSchema.methods.generateToken = function(cb) {
    var user = this;
    var token = jwt.sign(user._id.toHexString(), 'secretToken')

    user.token = token
    user.save(function(err, user) {
        if(err) return cb(err)
        cb(null, user)
    })
}

userSchema.statics.findByToken = function(token, cb) {
    var user = this;

    jwt.verify(token, 'secretToken', function(err,decoded){
        user.findOne({"_id": decoded, "token": token}, function(err,user){
            if(err) return cb(err);
            cb(null,user)
        })
    })
}

module.exports = User = mongoose.model("user", UserSchema);