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


app.listen(3000)
console.log('Server on port:', 3000);

