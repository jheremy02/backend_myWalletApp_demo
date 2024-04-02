const pool = require("../../db")
const CategoryService = require("../services/categories.service")
const  boom  = require("@hapi/boom")


const service = new CategoryService

const getCategory = async (req, res, next) => {
    try {
        const result = await service.getCategory(req.query.id)

        if (result.length <= 0) {
            throw boom.notFound('category not found')
        }

        res.json({
            data:{ ...result[0] },
            success:true
        })

    } catch (error) {
        next(error)
    }
}

const getCategories = async (req, res, next) => {
    try {
        const idUser=req.user.sub
        const roles=req.user.roles
        const result = await service.getCategories(idUser,roles)
        res.json({
            data:result,
            success:true
        })
    } catch (error) {
        next(error)
    }
}

const createCategory = async (req, res, next) => {
    try {
        const id_user=req.user.sub
        const { name} = req.body
        const result = await service.createCategory({ name, id_user })
        res.json({
            data:{ id: result.insertId, name, id_user },
            success:true
        })
    } catch (error) {

        next(error)
    }
}


const updateCategory = async (req, res, next) => {

    try {
       
        const { name, id_user, type_operation ,id} = req.body
        const result = await service.updateCategory({ name, id_user, type_operation, id })

        if (result.affectedRows <= 0) {

            throw boom.notFound('category not found');

        }

        const categoryFound = await service.getCategory(id)
        res.json({ message: 'updated successfully', success: true, category: { ...categoryFound[0] } })

    } catch (error) {
        next(error)
    }

}

const deleteCategory = async (req, res, next) => {
    try {
        const rows = await service.deleteCategory(req.params.id)

        if (rows.affectedRows <= 0) {

            throw boom.notFound('category Not found')

        }

        res.json({ message: 'deleted successfully', success: true })
    } catch (error) {

        next(error)

    }
}


module.exports = { getCategory, getCategories, createCategory, updateCategory,deleteCategory  }