import { NextFunction, Request, Response } from "express";
import prisma from "../Services/db";
import bcrypt from 'bcrypt';
import { DeletePayload, EditPayload, LoginPayload, RegisterPayload } from "../Models/User";
import { CustomRequest } from "../Models";
import jwt from "jsonwebtoken";
const login = async(req: CustomRequest<LoginPayload>, res: Response, next: NextFunction) => {
    try{
        const user = await prisma.usuario.findFirstOrThrow({
            where:{
                user: req.body.user,
                email: req.body.email
            }
        })
        if(!bcrypt.compareSync(req.body.password,user.password)) throw new Error()

        const token = jwt.sign({id:user.id},(process.env.JWT_SECRET_KEY as string),{
            expiresIn:60
        })

        res.status(200).json({
            status: true,
            message: "Logado",
            token
        })
    }
    catch(e){
        res.status(404).json({
            message: "Usuário ou senha inválidos",
            status: false,
        })
    }
    
    // if (req.body.user === 'vitor' && req.body.pwd === '123') {
    //     //auth ok
    //     const id = 1; //esse id viria do banco de dados
    //     var token = jwt.sign({ id }, "123", {
    //         expiresIn: 60 // expires in 5min
    //     });
    //     res.status(200).send({ auth: true, token: token });
    // }

}

const register = async(req:CustomRequest<RegisterPayload>, res: Response)=>{

    try{
        const user = await prisma.usuario.create({
            data:{
                ...req.body,
                password: bcrypt.hashSync(req.body.password,10)
            }
        })
        res.status(200).json(user)
    } catch(e){
        console.log(e)
        res.status(500).json({
            status: false,
            message: "Usuário já cadastrado"
        })

    }
}

const deleteUser = async(req:CustomRequest<DeletePayload>, res:Response)=>{
    try{
        const user = await prisma.usuario.delete({
        where:{
            id: req.params.id_user
            }
        })

        res.status(200).json({
            status: true,
            message: "Usuário deletado com sucesso"
        })

    } catch(e){
        res.status(500).json({
            status: false,
            message: "Usuário não encontrado"
        })
    }
}

const editUser = async (req:CustomRequest<EditPayload>, res:Response)=>{
    try{
        const user = await prisma.usuario.update({
            where:{
                id:req.body.id
            },
            data:{
                user: req.body.user
            }
        })
        res.status(200).json({
            status:true,
            message: "Usuário editado com sucesso"
        })
    }catch(e){
        res.status(500).json({
            status:false,
            message: "Não foi possível editar esse usuário"
        })
    }
}

export {
    login,
    register,
    deleteUser,
    editUser
}