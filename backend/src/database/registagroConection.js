import mysql from 'mysql2'
import 'dotenv/config'
import variaveis from '../config/variaveisGlobais.js'


const registagroConection = mysql.createConnection({
    user: variaveis.user,
    host: variaveis.host,
    password: variaveis.password,
    port: variaveis.database_port,
    database: variaveis.database1
})

export default registagroConection
