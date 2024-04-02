const express=require('express')
const passport = require('passport')
const router= express.Router()
const jwt=require('jsonwebtoken');
const { TOKEN_SECRET_KEY } = require('../../../config');
const { createUser } = require('../../controllers/users.controller');
const { validatorHandler } = require('../../middlewares/validator.handler');
const { creatUserSchema } = require('../../schemas/user.schema');
const { addRoles } = require('../../middlewares/auth.handler');

router.post('/login',
    passport.authenticate('local',{
        session:false
    }),
async(req,res,next)=>{
    
    try {
        
        const {id}=req.user
        const payload={
            sub:id,
            roles:req.user.roles
        }
        const token=jwt.sign(payload,TOKEN_SECRET_KEY);

        res.json({data:req.user,success:true,token});
        
    } catch (error) {
        
        next(error)

    }
})

router.post('/register',validatorHandler(creatUserSchema,'body'),addRoles([2]),createUser);

module.exports=router