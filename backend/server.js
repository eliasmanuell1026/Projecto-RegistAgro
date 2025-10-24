import app from "./app.js";
import 'dotenv/config'
import registagroConection from "./src/database/registagroConection.js"
import agtConection from "./src/database/agtConection.js";
import variaveis from "./src/config/variaveisGlobais.js"


registagroConection.connect(registagroError =>{
    if(registagroError){
        console.log("ERROR: RegistAgro error conection :(")
        return
    }

    agtConection.connect(agtError =>{
        if(agtError){
            console.log("ERROR: AGT error conection :(")
            return
        }
        
        app.listen(variaveis.server_port, () =>{
            console.log(`Servidor: http://${variaveis.host}:${variaveis.server_port}`)
        })
        
    })

})
