INSTALAÇÃO E EXECUÇÃO LOCAL
________________________________________________________

Requisitos:
    Node.Js e nmp instalados
    Servidor local como o Wampp Server ou o XAMPP com phpmyadmin para o MySQL


1 - Instale as dependências:
    npm install mysql2
    npm install cors
    npm install nodemon -D ou npm install --save-dev nodemon
    npm install dotenv

2 - Configure e importe o banco de dados MySQL:
    Use o phpMyAdmin com o XAMPP ou Wampp Server
    Importe os bancos de dados(db_registagro e db_agt) no phpmyadmin

3 - Teste de API:
    Use o Insomnia ou Postman para testes de API
    