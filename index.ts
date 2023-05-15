
import express from 'express'
import cors from 'cors'
import router from './app/Routes';


const app = express();

app.use(cors());

app.use(express.json())


// route.post("/encrypt", (req: Request, res: Response) => {
    
    //     const encryptedPassword = bcrypt.hashSync(req.body.pwd, 10)
    
//     res.status(200).send({encryptedPassword})
// })

// route.post("/check", (req: Request, res: Response) => {
    //     console.log(req)
    //     res.status(200).send({isEqual: bcrypt.compareSync(req.body.pwd, "$2b$10$s3qqa6GeB8bF3XFj3EE01Owwb2cWks0hnu5fSmEg4fNVEw8NAFhs2")})
    // })









app.use(router)

app.listen(3000, () => 'server running on port 3333')

