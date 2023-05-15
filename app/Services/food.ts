import { Food } from "../Models/Food";

const getKcal = (food: Food) => {
    const totalCarb = food.carboidrato * 4
    const totalProtein = food.proteina * 4
    const totalFat = food.lipideo * 9

    return totalCarb + totalProtein + totalFat
}

const getProportionalValue = (baseQuant: number, baseValue: number, newQuant: number) => {
    return +((baseValue * newQuant) / baseQuant).toFixed(2)
}

export const getFoodProportional = (quant: number, food: Food) => {
    const updatedFood =  (Object.fromEntries(Object.entries(food).map(el => {
        let newFoodValue = el[1];
        if (el[0] === "num" || el[0] === "umidade" || el[0] === "kcal") {
            return [el[0], newFoodValue]
        } else if (typeof newFoodValue === "number") {
            newFoodValue = getProportionalValue(100, newFoodValue, quant)
        }
        return [el[0], newFoodValue]
    })) as Food)

    updatedFood.kcal = getKcal(updatedFood)

    return updatedFood

}

type Category =
    "umidade" |
    "kcal" |
    "proteina" |
    "lipideo" |
    "colesterol" |
    "carboidrato" |
    "fibra_alimentar" |
    "calcio" |
    "magnesio" |
    "manganes" |
    "fosforo" |
    "ferro" |
    "sodio" |
    "potassio" |
    "cobre" |
    "zinco" |
    "retinol" |
    "tiamina" |
    "riboflavina" |
    "piridoxina" |
    "niacina" |
    "vitamina_c"


export const getSumNutrients = (foods: Food[]) => {
    const total = {
        umidade: 0,
        kcal: 0,
        proteina: 0,
        lipideo: 0,
        colesterol: 0,
        carboidrato: 0,
        fibra_alimentar: 0,
        calcio: 0,
        magnesio: 0,
        manganes: 0,
        fosforo: 0,
        ferro: 0,
        sodio: 0,
        potassio: 0,
        cobre: 0,
        zinco: 0,
        retinol: 0,
        tiamina: 0,
        riboflavina: 0,
        piridoxina: 0,
        niacina: 0,
        vitamina_c: 0
    }

    foods.forEach(food => {
        Object.entries(food).forEach((prop) => {
            if (typeof total[prop[0] as Category] !== "undefined") {
                total[(prop[0] as Category)] += prop[1]
            }
        })
    })

    return total
}
