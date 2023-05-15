
const getFoodProportional = (food)=>{
    const getProportionalValue = ( baseQuant, baseValue, newQuant) => {
        return ( baseValue * newQuant) / baseQuant
    }
    console.log(getProportionalValue(100, 2, 200))
}

getFoodProportional()