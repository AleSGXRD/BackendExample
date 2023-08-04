import pg from 'pg'

const pool = new pg.Pool({
    host:'dpg-cj5eetgeba7s73aa0f6g-a.oregon-postgres.render.com',
    user:'alexrd',
    password:"A7bfrm9e7cJFIdDIkw85WZYluXkzXzLQ",
    database:'exampledb_v5uo',
    port:'5432',
    connectionString: process.env.DATABASE_URL
})


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


export default {getUsers, createUser,getUserById,deleteUserById,updateUser};