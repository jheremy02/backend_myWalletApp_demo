const express=require('express')
const { validatorHandler } = require('../../middlewares/validator.handler')
const { createAccountCategory, getAccountsMoney, updateAccountMoney, deleteAccountMoney } = require('../../controllers/accountsMoney.controller')
const { updateAccountMoneySchema, createAccountMoneySchema, deleteAccountMoneySchema } = require('../../schemas/accountMoney.schema')

const router= express.Router()


router.post("/",validatorHandler(createAccountMoneySchema,'body'),createAccountCategory)
router.get("/",getAccountsMoney)
router.delete("/:id",validatorHandler(deleteAccountMoneySchema,'params'),deleteAccountMoney)
router.put("/",validatorHandler(updateAccountMoneySchema,'body'),updateAccountMoney)

module.exports=router