import pg from 'pg'
import { config } from "dotenv";

config()

/*const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL
})*/

const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL
})
console.log(!pool? 'DB connected': 'DB disconected');

const getUsers = async (req,res)=>{
   const response = await pool.query('SELECT * FROM users');
   console.log(response.rows);
   res.status(200).json(response.rows);
};

const getUserById = async(req,res)=>{
    const id = req.params.id;
    const response = await pool.query("SELECT * FROM users WHERE id = $1", [id])

    res.json(response.rows);
}

const createUser = async (req,res)=>{
    const { name, email} = req.body;

    const response = await pool.query('INSERT INTO users(name,email) VALUES ($1,$2)',[name,email]);
    console.log(response);
    res.json({
        massage: 'User Added Succesfully',
        body:{
            user: {name,email}
        }
    })
}

const updateUser = async(req,res)=>{
    const id= req.params.id;
    const {name, email} = req.body;
    const response = await pool.query('UPDATE users SET name = $1, email = $2 WHERE id = $3',[name,email,id]);

    console.log(response);
    res.status(200).json('User Updated Succesfully');
}

const deleteUserById = async(req,res)=>{
    const id = req.params.id;
    const response = await pool.query("DELETE FROM users WHERE id = $1", [id])

    res.json('User ${id} deleted success');
}

const ping = async (req,res)=>{
    const result = await pool.query('SELECT NOW()')
    return res.json(result.rows[0]);
}
const createTable = async (req,res)=>{
    const result = await pool.query("CREATE TABLE users (id SERIAL PRIMARY KEY,name VARCHAR(40),email TEXT);");
    return res.send('Table created');
}

export default {getUsers,
     createUser,
     getUserById,
     deleteUserById,
     updateUser,
     ping,
     createTable
    };