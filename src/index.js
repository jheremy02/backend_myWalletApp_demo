const express = require('express');
const routerApi = require('./routes/api/index.api');
const pool = require('../db');
const cors= require('cors');
const {PORT}=require('../config.js');
const { errorHandler,logErrors,boomErrorHandler } = require('./middlewares/error.handler.js');
const morgan = require('morgan');
const app = express();
const port = 3000;

app.use(express.json())
app.use(cors())
app.use(morgan('tiny'));
require('./utils/auth/index.js')
routerApi(app);
//middlware de tipo error van despues del routing
app.use(logErrors)
app.use(boomErrorHandler)
app.use(errorHandler)

app.use((req,res,next)=>{

    res.status(404).json({message:'endpoint not found',status:false});

 })

/*

    app.get('/',async  (req, res) => { 
    const [result] = await pool.query('select * from users')
    res.json(result)
 });
*/


app.listen(PORT, () => { console.log('Mi port' + PORT); });