import mysql from 'mysql2'

const conexao = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    port: 3306,
    database: 'db_registagro'
})

export default conexao
