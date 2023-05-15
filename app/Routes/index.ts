import express from 'express'
import userRoutes from './User'
import dietRoutes from './Diet'
import foodRoutes from './Food'

const router = express.Router()

router.use("/usuario",userRoutes)
router.use("/dieta", dietRoutes)
router.use("/alimento", foodRoutes)

export default router