const express=require('express')
const { getOperations, createOperation, getOperation, updateOperation, deleteOperation, getOperationsReport } = require('../../controllers/operations.controller')
const { validatorHandler } = require('../../middlewares/validator.handler')
const { updateOperationSchema, createOperationSchema, deleteOperationSchema, getOperationsSchema, getOperationSchema } = require('../../schemas/operation.schema')

const router= express.Router()

router.get('/getOperationsReport',getOperationsReport)
router.get('/', validatorHandler(getOperationsSchema,'query'),getOperations)
router.get('/',validatorHandler(getOperationSchema,'query'),getOperation)
router.post('/',validatorHandler(createOperationSchema,'body'),createOperation)
router.delete('/',validatorHandler(deleteOperationSchema,'query'), deleteOperation)
router.put('/' ,validatorHandler(updateOperationSchema,'body') ,updateOperation)

module.exports=router