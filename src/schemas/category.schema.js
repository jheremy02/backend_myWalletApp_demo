const Joi = require("joi");

const id=Joi.number().integer()
const name=Joi.string().max(150)
const id_user=Joi.number()
const type_operation=Joi.string().valid('OUT','IN')

const createCategorySchema=Joi.object({
    name:name.required(),
    id_user:id_user.required(),
   
}).unknown(true)

const getCategorySchema=Joi.object({
    id:id.required()
})


const updateCategorySchema=Joi.object({
    id:id.required(),
    name:name,
    id_user:id_user,
    type_operation:type_operation
}).unknown(true)

const getCategoriesSchema=Joi.object({

})

const deleteCategorySchema=Joi.object({
    id:id.required()
}).unknown(true)

module.exports={
    createCategorySchema,
getCategorySchema,
updateCategorySchema,
deleteCategorySchema
}