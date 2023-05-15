import { Request } from "express"


interface LoginPayload {
    user?: string
    email?:string
    password: string
}

interface RegisterPayload {
    user: string,
    email: string,
    password:string
}

interface EditPayload {
    id: string,
    user?: string,
    password?: string
}

interface DeletePayload {
    id: string
}


export {
    LoginPayload,
    RegisterPayload,
    EditPayload,
    DeletePayload
}