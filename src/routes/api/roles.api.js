const express=require('express')
const { getRoles } = require('../../controllers/roles.controller')
const router= express.Router()

router.get('/', getRoles)

module.exports=router