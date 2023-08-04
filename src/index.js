import express from "express";
import { config } from "dotenv";
import router from "./routes/index.js";

config()

const app = express()

app.use(express.json());
app.use(express.urlencoded({extended: false}));

app.use(router);

app.listen(3000)
console.log('Server on port:', 3000);

