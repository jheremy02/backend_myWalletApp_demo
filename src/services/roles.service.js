const pool = require("../../db")

class RoleService {
    constructor() { }


    async getRolesService() {
        try {
            const [rows] = await pool.query("SELECT * FROM roles")

            return rows
        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }

    async getRolesByIdUser(idUser) {

        try {
            const [rows] = await pool.query("SELECT * FROM roles WHERE idUser=?", [idUser])

            return rows
        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }
}

module.exports = RoleService