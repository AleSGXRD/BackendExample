import { Router } from "express";

const router = Router();

import controller from "../controllers/index.controllers.js"

router.get('/', controller.getUsers);

router.get('/:id', controller.getUserById);

router.delete('/:id', controller.deleteUserById);

router.post('/newuser', controller.createUser); 

router.put('/:id', controller.updateUser);

router.get('/ping', async (req,res)=>{
    const result = await pool.query('SELECT NOW()')
    return res.json(result.rows[0]);
})

export default router;