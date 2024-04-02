const {Strategy}=require("passport-local")
const UserService = require("../../../services/user.service")
const  boom  = require("@hapi/boom")
const userService= new UserService()
const bcrypt = require('bcrypt')
const LocalStrategy= new Strategy(async (username,password,done)=>{

    try {
        //username=>email
    const result=await userService.getUserByEmail(username)
    if (result.length <= 0) {
        throw boom.notFound('Ingrese correctamente su usuario o contraseña')
    }

    const userFound=result[0]
    const isMatched = await bcrypt.compare(password, userFound.password);

    if (isMatched) {
        delete userFound.password;
        const resultRoles =await userService.getUserRoles(userFound.id)
        const roles=resultRoles.map((role)=>role.idRole)
        done(null,{...userFound,roles})
    } else {
        done(boom.unauthorized("Ingrese correctamente su usuario o contraseña"),false)
    }

    } catch (error) {
        done(error,false)
    }
    
    
})

module.exports=LocalStrategy
