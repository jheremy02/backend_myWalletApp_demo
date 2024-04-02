const Joi = require("joi");

const id= Joi.number().integer()
const first_name= Joi.string().max(100)
const last_name=Joi.string().max(100)
const email=Joi.string().email().max(100)
const description = Joi.string().max(200)
const password=Joi.string().max(100)
const roles=Joi.array().min(1).message("Debe seleccionar almenos un rol");


const creatUserSchema= Joi.object({
    id:id,
    first_name:first_name.required(),
    last_name:last_name.required(),
    email:email.required(),
    description:description,
    password:password.required(),
}).unknown(true);

const getUserSchema = Joi.object({
    id:id.required()
})

const updateUserSchema=Joi.object({
    id:id.required(),
    first_name:first_name,
    last_name:last_name,
    email:email,
    description:description,
    roles:roles.required()
})

const getUsersSchema=Joi.object({

})

module.exports={
    getUserSchema,creatUserSchema,updateUserSchema
}