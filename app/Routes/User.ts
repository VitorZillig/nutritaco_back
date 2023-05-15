import express from 'express'
import { deleteUser, editUser, login, register } from '../Controllers/User'

const router = express.Router()

router.post('/login', login)

router.post("/register", register)

router.delete("/delete/:user_id", deleteUser)

router.patch("/edit", editUser)

export default router