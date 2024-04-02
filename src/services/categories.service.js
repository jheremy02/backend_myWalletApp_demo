const pool = require("../../db");
const RoleService = require("./roles.service");
const UserService = require("./user.service");

const rolesService = new RoleService()
class CategoryService {

    constructor() {

    }

    async getCategory(id) {

        try {

            const [rows] = await pool.query('SELECT * FROM categories_type_operation WHERE id=?', [id])

            return rows

        } catch (error) {

            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }

    }

    async getCategories(idUser,roles) {

        try {
            if (roles.includes(1)) {
                const [result] = await pool.query('SELECT * from categories_type_operation')
                return result
            } else {
                const [result] = await pool.query('SELECT * from categories_type_operation where id_user=?', [idUser])
                return result
            }

        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }

    }

    async createCategory(newCategory) {

        try {
            const { name, id_user, type_operation } = newCategory
            // [rows] destructuring de un array -> [rows] = [x,y,z] rows toma del valor de x respectivamente
            const [rows] = await pool.query('INSERT INTO categories_type_operation (name,id_user) VALUES (?,?)', [name, id_user]);

            return rows

        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }

    async updateCategory(updatedCategory) {
        try {
            const { id, name, id_user, type_operation } = updatedCategory
                
            const [result] = await pool.query(`UPDATE categories_type_operation
            SET name =IFNULL(?,name), id_user = IFNULL(?,id_user) , type_operation= IFNULL(?,type_operation)  WHERE id = ? `, [name, id_user, type_operation, id])
        
            return result

        } catch (error) {

            throw new Error(error.message)

        } finally {
            pool.releaseConnection();
        }
    }

    async deleteCategory(id) {
        try {
            const [rows] = await pool.query('DELETE FROM categories_type_operation where id=?', [id])

            return rows
        } catch (error) {
            throw new Error("No es posible borrar, ya hay relaciones asociadas con este dato")
        } finally {
            pool.releaseConnection();
        }
    }




}

module.exports = CategoryService