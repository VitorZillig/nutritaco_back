import express from 'express'
import { getFood } from '../Controllers/Food'

const router = express.Router()

router.post('/getAll', getFood)

export default router