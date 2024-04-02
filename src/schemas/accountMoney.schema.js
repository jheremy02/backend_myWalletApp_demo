const Joi = require("joi");

const id=Joi.number().integer()
const name=Joi.string().max(200)
const name_company=Joi.string().max(200)

const createAccountMoneySchema=Joi.object({
    name:name.required(),
    name_company:name_company.required()
}).unknown(true)

const updateAccountMoneySchema=Joi.object({
    id:id.required()
}).unknown(true)

const deleteAccountMoneySchema=Joi.object({
    id:id.required()
}).unknown(true)

module.exports={

    createAccountMoneySchema,
    updateAccountMoneySchema,
    deleteAccountMoneySchema

}