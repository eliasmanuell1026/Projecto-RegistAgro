import mysql from 'mysql2'
import variaveis from '../config/variaveisGlobais.js'


const agtConection = mysql.createConnection({
    user: variaveis.user,
    host: variaveis.host,
    password: variaveis.password,
    port: variaveis.database_port,
    database: variaveis.database2
})

export default agtConection
