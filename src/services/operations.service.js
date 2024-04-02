const pool = require("../../db");
const { getCurrentDate } = require("../utils/auth/functionsTools");
const AccountMoneyService = require("./accountMoney.service");

const boom = require("@hapi/boom")
const accountService = new AccountMoneyService();

class OperationService {

    constructor() {
        this.connection = null
    }

    async setConnection(connection) {
        this.connection = connection
    }

    async getOperation(id) {
        try {
            const [result] = await pool.query('SELECT * FROM operations WHERE id=?', [id])
            if (result.length <= 0) {
                throw new Error('Operation not found');
            }
            return result[0]
        } catch (error) {
            throw error;
        } finally {
            pool.releaseConnection();
        }
    }

    async getOperations(params) {
        try {
            const { start, endFormatted, idUser } = params
            if (start && endFormatted) {
                const [result] = await pool.query('SELECT * FROM operations WHERE (date_operation BETWEEN ? and ?) and id_user=?', [start, endFormatted, idUser])
                return result
            } else {
                const currentDate = getCurrentDate()
                const [result] = await pool.query('SELECT * FROM operations WHERE id_user=?', [idUser])
                return result
            }


        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }

    async createOperation(newOperation) {


        try {
            await this.connection.beginTransaction();
            const { id_user, type_operation, state_operation, description, id_type_category, date_operation_time, quantity, id_account_money } = newOperation
            const [result] = await this.connection.query('INSERT INTO operations (id_user,type_operation,state_operation,id_type_category,description,date_operation,quantity,id_account_money) values (?,?,?,?,?,?,?,?)', [id_user, type_operation, state_operation, id_type_category, description, date_operation_time, quantity, id_account_money])



            await this.connection.commit()
            return result

        } catch (error) {
            await this.connection.rollback();
            throw error;
        }


    }

    async reportsService(params) {
        try {
            const { report_name, year, start, end, id_user } = params

            if (report_name == 'operations_by_month') {
                const [result_in] = await this.connection.query(`SELECT MONTH(date_operation) AS month, SUM(quantity) AS total FROM operations WHERE YEAR(date_operation) = ? and  type_operation= 'IN' and id_user=? GROUP BY
                    MONTH(date_operation) ORDER BY month`, [year, id_user])
                const [result_out] = await this.connection.query(`SELECT MONTH(date_operation) AS month, SUM(quantity) AS total FROM operations WHERE YEAR(date_operation) = ? and  type_operation= 'OUT' and id_user=? GROUP BY
                    MONTH(date_operation) ORDER BY month`, [year, id_user,])

                return { result_in, result_out }
            } else if (report_name == 'operations_daily') {
                console.log(start,end,id_user)
                const [result_in_daily] = await this.connection.query(`SELECT DATE_FORMAT(date_operation, '%Y-%m-%d') AS formatted_date, sum(quantity) AS total
                    FROM operations
                    where type_operation='IN' and id_user=? and (date_operation between ? and ?)
                    GROUP BY formatted_date order by formatted_date;`, [id_user, start, end])



                const [result_out_daily] = await this.connection.query(`SELECT DATE_FORMAT(date_operation, '%Y-%m-%d') AS formatted_date, sum(quantity) AS total
                    FROM operations
                    where type_operation='OUT' and id_user=?  and (date_operation between ? and ?) GROUP BY formatted_date order by formatted_date;`, [id_user, start, end])

                    console.log({ result_in_daily, result_out_daily })

                return { result_in_daily, result_out_daily }
            } else if (report_name == 'totals') {
                const [total_in] = await this.connection.query(`select sum(quantity) as total_in from operations where type_operation='IN' and  state_operation='DONE' and id_user=? ;`, [id_user])

                const [total_out] = await this.connection.query(`select sum(quantity) as total_out from operations where type_operation='OUT' and  state_operation='DONE' and id_user=? ;`, [id_user])



                return { total_in: total_in[0].total_in, total_out: total_out[0].total_out }
            } else {
                throw new Error('No se encontro la operacion')
            }

        } catch (error) {
            throw error
        } 
    }

    async updateOperation(updatedOperation) {

        try {
            await this.connection.beginTransaction();

            let { id, id_user, type_operation, state_operation, description, id_type_category, quantity, id_account_money, date_operation_time } = updatedOperation;

            console.log(description)

            const [result] = await this.connection.query('UPDATE operations SET id_user = IFNULL(?,id_user), type_operation = IFNULL(?,type_operation), state_operation= IFNULL(?,state_operation), id_type_category = IFNULL(?,id_type_category), description = IFNULL(?,description), quantity = IFNULL(?,quantity), id_account_money = IFNULL(?,id_account_money), date_operation = IFNULL(?,date_operation) WHERE id=?', [id_user, type_operation, state_operation, id_type_category, description, quantity, id_account_money, date_operation_time, id]);


            await this.connection.commit()
            return result

        } catch (error) {
            await this.connection.rollback();
            throw error;
        } 
    }

    async deleteOperation(id) {

        try {
            await this.connection.beginTransaction();

            const result = await this.connection.query('DELETE FROM OPERATIONS WHERE id=?', [id]);

            if (result.affectedRows <= 0) {
                throw boom.notFound('Operation not found');
            }

            await this.connection.commit();

            return result;
        } catch (error) {
            await this.connection.rollback();
            throw error;
        } finally {
            this.connection.release();
        }
    }



}

module.exports = OperationService