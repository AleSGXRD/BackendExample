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
app.get('/createtable1',async (req,res)=>{
    const result = await pool.query("CREATE TABLE User(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL,password TEXT NOT NULL);");
    return res.send('Table created');
})
app.get('/createtable2',async (req,res)=>{
    const result = await pool.query("CREATE TABLE Client (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,name TEXT,ci TEXT,email TEXT,phoneNumber TEXT);");
    return res.send('Table created');
})
app.get('/createtable3',async (req,res)=>{
    const result = await pool.query("CREATE TABLE Order (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,kind TEXT,brand TEXT,motherBoard TEXT,CPU TEXT,powerSupply TEXT,GPU TEXT,HDD TEXT,RAM TEXT,others TEXT,description TEXT,price INTEGER NOT NULL DEFAULT 0,createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,clientId INTEGER NOT NULL DEFAULT 0,CONSTRAINT Order_clientId_fkey FOREIGN KEY (clientId) REFERENCES Client (id) ON DELETE RESTRICT ON UPDATE CASCADE);");
    return res.send('Table created');
})
app.get('/createtable4',async (req,res)=>{
    const result = await pool.query("CREATE TABLE OrderFinished (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,kind TEXT,brand TEXT,motherBoard TEXT,CPU TEXT,powerSupply TEXT,GPU TEXT,HDD TEXT,RAM TEXT,others TEXT,description TEXT,price INTEGER NOT NULL DEFAULT 0,completed BOOLEAN NOT NULL DEFAULT false,createdAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,finishedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,clientId INTEGER NOT NULL DEFAULT 0,CONSTRAINT OrderFinished_clientId_fkey FOREIGN KEY (clientId) REFERENCES Client (id) ON DELETE RESTRICT ON UPDATE CASCADE);");
    return res.send('Table created');
})
app.get('/createtable5',async (req,res)=>{
    const result = await pool.query("CREATE UNIQUE INDEX User_name_key ON User(name);");
    return res.send('Table created');
})
app.get('/createtable6',async (req,res)=>{
    const result = await pool.query("CREATE UNIQUE INDEX User_password_key ON User(password);");
    return res.send('Table created');
})
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

