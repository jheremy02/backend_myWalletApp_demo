const pool = require("../../db");

const  boom  = require("@hapi/boom")
class AccountMoneyService {

    constructor(){
        this.connection=null
    }

    async setConnection(connection){
        
        this.connection=connection
        
    }

    async createAccountMoney(newAccount) {

            const {name,id_user,name_company,total_money}=newAccount
            try {
                const [result]=await pool.query('INSERT INTO account_money  (name,id_user,name_company,total_money) VALUES (?,?,?,?)',[name,id_user,name_company,total_money])

                return result
            } catch (error) {
                throw new Error(error.message)
            } finally {
                pool.releaseConnection();
            }

    }

    async updateQuantityAccount(idAccount, type_operation, newAquantity) {
     
        try {
            
            await this.connection.beginTransaction();
            
            const response = await this.getAccountMoneyById(idAccount);
    
            if (response.length <= 0) {
                throw new Error('Account Not found');
            }
    
            const [accountFound] = response;
            let quantityAccount = accountFound.total_money;
    
            if (type_operation === 'IN') {
                quantityAccount += newAquantity;
            } else if (type_operation === 'OUT') {
                quantityAccount -= newAquantity;
    
                if (quantityAccount < 0) {
                    throw new Error('Monto insuficiente en la cuenta');
                }
            } else {
                throw new Error('Operacion desconocida');
            }
    
            const [result] = await this.connection.query(
                `UPDATE account_money SET total_money=IFNULL(?,total_money)  WHERE id = ? `,
                [quantityAccount, idAccount]
            );
    
            await this.connection.commit();
            return result;
        } catch (error) {
           
            await this.connection.rollback();
            throw error;
        }
    }
    

    async getAccountsMoneyService(idUser,roles) {
        
        try {

            if (roles.includes(1)) {

                const [result] = await pool.query('SELECT * from account_money')
                return result

            } else {
                const [result] = await pool.query('SELECT * from account_money  where id_user=?', [idUser])

                return result
            }

        } catch (error) {

            throw new Error(error.message);
            
        } finally {
            pool.releaseConnection();
        }

    }

     async getTotalsAccount(idUser){
        try {
            const [result]=await pool.query(`select sum(total_money) as total_money from account_money where id_user=?;`,[idUser]);
            
            return result[0]
        } catch (error) {
            throw error
        }
     }

    async updateAccountMoneyService(updatedAccount) {

        try {
            const {id, name,  name_company}=updatedAccount
            const [result] = await pool.query(`UPDATE account_money
            SET name =IFNULL(?,name), name_company= IFNULL(?,name_company)  WHERE id = ? `, [name, name_company, id])

            return result
        } catch (error) {
            throw new Error(error.message);
        } finally {
            pool.releaseConnection();
        }

    }

    async getAccountMoneyById(id){
        try {

            
            const [rows] = await pool.query('SELECT * FROM account_money WHERE id=?', [id])

            return rows

        } catch (error) {

            throw new Error(error.message)
        }
    }

    async deleteAccountMoney(idAccount){
        try {
            const [rows] = await pool.query('DELETE FROM account_money WHERE id=?', [idAccount])
            return rows
        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }

}

module.exports=AccountMoneyService