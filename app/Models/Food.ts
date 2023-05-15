export interface Food {
    num: number,
    name: string,
    category: string,
    umidade: number,
    kcal: number,
    proteina: number,
    lipideo: number,
    colesterol: number,
    carboidrato: number,
    fibra_alimentar: number,
    calcio: number,
    magnesio: number,
    manganes: number,
    fosforo: number,
    ferro: number,
    sodio: number,
    potassio: number,
    cobre: number,
    zinco: number,
    retinol: number,
    tiamina: number,
    riboflavina: number,
    piridoxina: number,
    niacina: number,
    vitamina_c: number   
}

export interface SearchFoodsPayload {
    num?: number
    name?: string,
    category?:string
}

export interface FoodOnDiet {
    quant?: number,
    alimento_id: number
}