const pool = require("../../db")

const  boom  = require("@hapi/boom")

const AccountMoneyService = require("../services/accountMoney.service")

const service = new AccountMoneyService

const createAccountCategory=async (req,res,next) =>{

    try {
        const id_user=req.user.sub
        const { name,  name_company, total_money}=req.body
        const result= await service.createAccountMoney({ name, id_user, name_company, total_money})
        res.json({data:{id:result.insertId,name,  name_company, total_money},success:true})
    } catch (error) {
        next(error)
    }

}

const getAccountsMoney=async (req,res,next) =>{
    try {
        const id_user=req.user.sub
        const roles=req.user.roles
        const result=await service.getAccountsMoneyService(id_user,roles)
        res.json({
            data:result,
            success:true
        })
    } catch (error) {
        next(error)
    }
}



const updateAccountMoney=async(req,res,next)=>{

    try {
        const {id,name,name_company}=req.body
        const result = await service.updateAccountMoneyService({id,name,name_company})
        if (result.affectedRows <= 0) {

            throw boom.notFound('Account not found');

        }

        const accountFound=await service.getAccountMoneyById(id)
        res.json({ message: 'updated successfully', success: true, data: { ...accountFound[0] } })

    } catch (error) {
        next(error)
    }

}

const deleteAccountMoney=async(req,res,next)=> {
    try {
        const result=await service.deleteAccountMoney(req.params.id)
        
        if (result.affectedRows <= 0) {

            throw boom.notFound('Account Not found');
        }

        res.json({ message: 'deleted successfully', success: true })
    } catch (error) {
        next(error)
    }
}


module.exports={createAccountCategory,getAccountsMoney,updateAccountMoney,deleteAccountMoney}