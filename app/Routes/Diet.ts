import express from 'express'
import { createDiet, deleteDiet, getDiets } from '../Controllers/Diet'

const router = express.Router()

router.post("/create", createDiet)

router.patch("/edit", createDiet)

router.post("/getAll", getDiets)

router.delete("/delete", deleteDiet)

export default router