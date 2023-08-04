import { Router } from "express";

const router = Router();

import controller from "../controllers/index.controllers.js"

router.get('/', controller.getUsers);

router.get('/:id', controller.getUserById);

router.delete('/:id', controller.deleteUserById);

router.post('/newuser', controller.createUser); 

router.put('/:id', controller.updateUser);

router.get('/ping', controller.ping)

router.get('/createtable', controller.createTable)


export default router;