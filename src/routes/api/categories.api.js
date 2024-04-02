const express=require('express')
const { getCategories, getCategory, createCategory, updateCategory, deleteCategory } = require('../../controllers/categories.controller')
const { validatorHandler } = require('../../middlewares/validator.handler')
const { getCategorySchema, createCategorySchema, deleteCategorySchema, updateCategorySchema } = require('../../schemas/category.schema')

const router= express.Router()

router.get('/',getCategories)
router.get('/:id', validatorHandler(getCategorySchema,'query'), getCategory)
router.post('/', validatorHandler(createCategorySchema,'body'), createCategory)
router.delete('/:id',validatorHandler(deleteCategorySchema,'params'),deleteCategory)
router.put('/',validatorHandler(updateCategorySchema,'body'),updateCategory)

module.exports=router