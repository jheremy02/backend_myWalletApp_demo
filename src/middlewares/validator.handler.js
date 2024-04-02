const boom = require("@hapi/boom")

function validatorHandler(schema,property) {
    return async function (req,res,next) {
        
        const id_user=req.user?.sub || null
        //console.log(req.user.sub)
        const data=req[property]
        const {error}=schema.validate({...data,id_user})

        if (error) {
            next(boom.badRequest(error))
        } else {
            next()
        }
    }
}


module.exports={validatorHandler}