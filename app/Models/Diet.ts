import { FoodOnDiet } from "./Food"

interface SearchDietsPayload {
    id_user: string,
    nome?: string
}

interface CreateDietPayload {
    id_dieta?: string,
    name: string,
    id_user: string,
    alimentos:FoodOnDiet[]
}

interface EditDietPayload {
    id_diet: string,
    diet:{
        name?: string,
        alimentos?: FoodOnDiet[]
    }
}

interface DeleteDietPayload {
    id_diet: string
}

export {
    SearchDietsPayload,
    CreateDietPayload,
    EditDietPayload,
    DeleteDietPayload
}