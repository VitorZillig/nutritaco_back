import { NextFunction, Request, Response } from "express";
import prisma from "../Services/db";
import bcrypt from 'bcrypt';
import { CustomRequest } from "../Models";
import { CreateDietPayload, DeleteDietPayload, EditDietPayload, SearchDietsPayload } from "../Models/Diet";
import { getFoodProportional, getSumNutrients } from "../Services/food";

const createDiet = async (req: CustomRequest<CreateDietPayload>, res: Response) => {
    try {
        const dieta = await prisma.dieta.upsert({
            where: {
                id: req.body?.id_dieta || ""
            },
            update: {
                name: req.body.name,
                alimentos: {
                    upsert: req.body.alimentos.map(alimento => ({
                        where: {
                            alimento_id_dieta_id: {
                                alimento_id: alimento.alimento_id,
                                dieta_id: req.body?.id_dieta || ""
                            }
                        },
                        update: alimento,
                        create: alimento,
                    }))
                }
            },
            create: {
                name: req.body.name,
                id_user: req.body.id_user,
                alimentos: {
                    create: req.body.alimentos
                }
            }
        })

        res.status(200).json(dieta)

    } catch (e) {
        res.status(500).json({
            status: false,
            message:`Não foi possível ${req.body.id_dieta ? "editar" : "criar"} essa dieta`
        })
    }

}


const getDiets = async (req: CustomRequest<SearchDietsPayload>, res: Response) => {

    try {
        const dietas = await prisma.dieta.findMany({
            where: {
                ...req.body,
                id_user: req.body.id_user,
            }, include: {
                alimentos: {
                    select: {
                        quant: true,
                        alimento: true
                    }
                }
            }
        })

        const getSumarizedDiets = dietas.map(dieta=>{
            const getProportionalFoods = dieta.alimentos.map(alimento=>{
                return getFoodProportional(alimento.quant,alimento.alimento)

            })
            return {
                ...dieta,
                alimentos: getSumNutrients(getProportionalFoods)
            }
        })

        res.status(200).json({
            status: true,
            message: "Pesquisa concluída",
            dietas:getSumarizedDiets
        })

    } catch (e) {
        res.status(500).json({
            status: false,
            message: "Não foi possível pesquisar as dietas"
        })
    }

}



const deleteDiet = async (req: CustomRequest<DeleteDietPayload>, res: Response) => {
    try {
        const diet = await prisma.dieta.delete({
            where: {
                id: req.body.id_diet
            }
        })
        res.status(200).json({
            status: true,
            message: "Dieta deletada com sucesso"
        })

    } catch (e) {
        res.status(500).json({
            status: false,
            message: "Registro não encontrado"
        })
    }
}

export {
    createDiet,
    getDiets,
    deleteDiet
}