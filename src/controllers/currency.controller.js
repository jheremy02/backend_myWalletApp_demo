const pool = require("../../db");
const boom = require("@hapi/boom");
const CurrencyService = require("../services/currency.service");

const serviceCurrency = new CurrencyService();

const getCurrencies = async (req, res, next) => {
    try {
        const result = await serviceCurrency.getCurrencies()
        res.json({
            data: result,
            success: true
        })
    } catch (error) {
        next(error)
    }
}


const updateCurrencyUser = async (req, res, next) => {
    const connection = await pool.getConnection()
    try {
        serviceCurrency.setConnection(connection)
        await connection.beginTransaction()
        const { id_currency } = req.body
        const idUser = req.user.sub
        const currencyUserFound = await serviceCurrency.getCurrencyUser(idUser);
        console.log(currencyUserFound)
        if (currencyUserFound) {

            const result = await serviceCurrency.updateCurrencyUser(currencyUserFound.id_currency_user, id_currency);
            await connection.commit();
            res.json({ data: { id_currency }, success: true })

        }

        /*
            else {

            const result = await serviceCurrency.createCurrencyUser(idUser, id_currency);
            await connection.commit();
            res.json({ data: result, success: true })
        }
        */


    } catch (error) {
        await connection.rollback();
        next(error)
    } finally {
        connection.release();
    }

}

const getCurrencyUser = async (req, res, next) => {
    
    try {

        const idUser = req.user.sub
     
        const currencyUserFound = await serviceCurrency.getCurrencyUser(idUser);
        
        const currencyFound = await serviceCurrency.getCurrencyById(currencyUserFound.id_currency)
        res.json({ data: { ...currencyUserFound, ...currencyFound }, success: true })

    } catch (error) {

        next(error) ;

    }
}

module.exports = { getCurrencyUser, updateCurrencyUser, getCurrencies }