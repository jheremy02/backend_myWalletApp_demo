const express=require('express')

const { validatorHandler } = require('../../middlewares/validator.handler')
const {getCurrencyUser,updateCurrencyUser,getCurrencies}=require('../../controllers/currency.controller')

const router= express.Router();

router.get('/',getCurrencies);
router.get('/myCurrency', getCurrencyUser);
router.put('/',updateCurrencyUser);

module.exports=router