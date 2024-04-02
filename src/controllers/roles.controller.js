
const pool = require("../../db")

const  boom  = require("@hapi/boom")
const RoleService = require("../services/roles.service")

const service=new RoleService()

const getRoles=async (req, res,next) =>{
    try {
        const result=await service.getRolesService()
     
        res.json({
            data:result,
            success:true
        })
    } catch (error) {
        next(error)
    }
}

module.exports={getRoles}