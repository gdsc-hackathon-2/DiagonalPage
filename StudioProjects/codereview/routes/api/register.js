const express = require("express");
const User = require("../../models/User");
const router = express.Router();
const bcrypt = require("bcrypt.js");

router.post(
    "/",
    async(res, req) => {
        const {id, nickname, password} = req.body;

        try{
            let user = await User.findOne({id});
                if(user) {
                    return res
                    .status(400)
                    .json({errors: [{msg: "User already exists"}]});
                }
            user = new user({
                id,
                nickname,
                password
            });

            const salt = await bcrypt.genSalt(10);
            user.password = await bcrypt.hash(password, salt);

            await user.save();

            res.send("success");
        } catch(error) {
            console.error(error.message);
            res.status(500).send("Server error");
        }
    }
);