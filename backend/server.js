import app from "./app.js";
import 'dotenv/config'
import conexao from "./src/model/conexao.js";


const port = process.env.PORT 
const host = process.env.HOST

conexao.connect(erro =>{
    if(erro){
        console.log(erro)
    }else{
        app.listen(port, () =>{
            console.log(`Servidor: http://${host}:${port}`)
        })

    }
})
