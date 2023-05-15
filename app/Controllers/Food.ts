import { NextFunction, Request, Response } from "express";
import prisma from "../Services/db";
import { CustomRequest } from "../Models";
import { SearchFoodsPayload } from "../Models/Food";

const getFood = async(req: CustomRequest<SearchFoodsPayload>, res: Response) => {
    try{
        const allRegisters = await prisma.alimento.findMany({
            where:{
                ...req.body
            }
        })
        res.status(200).json(allRegisters)

    }catch(e){
        res.status(500).json({
            status: false,
            message: "Filtro não existente"
        })
    }
}

export {
    getFood
}