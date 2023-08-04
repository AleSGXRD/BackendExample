import express from "express";
import { config } from "dotenv";
import pg from 'pg'

config();
const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL
})
console.log(!pool? 'DB connected': 'DB disconected');

const app = express()

app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.get('/test', async (req,res)=>{
    res.send('test');
})
app.get('/ping',  async (req,res)=>{
    const result = await pool.query('SELECT NOW()')
    return res.json(result.rows[0]);
})
/*app.get('/createtable',async (req,res)=>{
    const result = await pool.query("CREATE TABLE users (id SERIAL PRIMARY KEY,name VARCHAR(40),email TEXT);");
    return res.send('Table created');
})*/
app.post('/users', async (req,res)=>{
    const { name, email} = req.body;

    const response = await pool.query('INSERT INTO users(name,email) VALUES ($1,$2)',[name,email]);
    console.log(response);
    res.json({
        massage: 'User Added Succesfully',
        body:{
            user: {name,email}
        }
    })
})
app.get('/users', async (req,res)=>{
    const response = await pool.query('SELECT * FROM users');
    console.log(response.rows);
    res.status(200).json(response.rows);
 })


app.listen(3000)
console.log('Server on port:', 3000);

