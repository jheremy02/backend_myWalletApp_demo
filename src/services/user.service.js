
const pool = require("../../db")
const bcrypt = require('bcrypt')
const  boom  = require("@hapi/boom")
class UserService {
    constructor() {

        this.connection=null ;  

    }

    setConnection(connection){
        this.connection=connection
    }

    async getUser(id) {
        let connection ;
        try {
            connection=await pool.beginTransaction()
            const [rows] = await pool.query('SELECT * FROM users WHERE id=?', [id])
            if (rows.length <= 0) {
                throw boom.notFound('User not found')
            }

            await connection.commit()
            return rows

        } catch (error) {
            await connection.rollback()
            throw new Error(error.message)
        } finally {
           // pool.releaseConnection()
        }


    }

    async getUsers() {

        try {
            const [result] = await pool.query('select * from users')
            return result
        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection()
        }

    }

    async getUserRoles (idUser){
        try {
            const [result] = await pool.query('select * from roles_users where idUser=?',[idUser])
            console.log(result)
            return result
        } catch (error) {
            throw new Error(error.message)
        }finally {
            pool.releaseConnection()
        }
    }   

    

    async createUser(newUser) {
        const { first_name, last_name, email, description, password ,roles} = newUser;
        const hashedPassword = await bcrypt.hash(password, 10);
      
        try {
          //const connection = await pool.getConnection();
          await  this.connection.beginTransaction();
      
          try {
            const [row] = await  this.connection.query(
              'INSERT INTO users (first_name, last_name, email, description, password) VALUES (?, ?, ?, ?, ?)',
              [first_name, last_name, email, description, hashedPassword]
            );
      
            
            await Promise.all(roles.map(async (role) => {
                
              await  this.connection.query('INSERT INTO roles_users (idRole, idUser) VALUES (?, ?)', [ role,row.insertId]);
        
            }));
      
            await  this.connection.commit();
            return row; // Assuming you only need the first row (created user)
          } catch (error) {
            await  this.connection.rollback();
            throw error;
          } finally {
            this.connection.release();
          }
        } catch (error) {
          throw new Error(`Error creating user: ${error.message}`);
        }
      }

    async updateUser(updatedUser) {
        const { first_name,
            last_name,
            email,
            description, id } = updatedUser
        try {
            const [result] = await pool.query(`UPDATE users
            SET first_name =IFNULL(?,first_name), last_name = IFNULL(?,last_name) , email = IFNULL(?,email) , description= IFNULL(?,description) WHERE id = ? `, [first_name,
                last_name,
                email,
                description, id])

            return result

        } catch (error) {

            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }
    async deleteUser(id) {
        try {
            const [rows] = await pool.query('DELETE  FROM users WHERE id=?', [id])
            return rows
        } catch (error) {
            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }

    async getUserByEmail(email) {
        try {

            const [rows] = await pool.query('SELECT * FROM users WHERE email=?', [email])

            return rows

        } catch (error) {

            throw new Error(error.message)
        } finally {
            pool.releaseConnection();
        }
    }

}

module.exports = UserService
