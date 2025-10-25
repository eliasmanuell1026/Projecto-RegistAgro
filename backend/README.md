🚀 Instalação e Execução Local
📋 Requisitos

Antes de começar, garanta que tenha instalado em sua máquina:

Node.js
 e npm

Um servidor local como XAMPP ou WampServer (com phpMyAdmin para o MySQL)

⚙️ 1. Instalação das Dependências

Abra o terminal na raiz do projeto e execute:

# Instalar o framework Express
npm install express

# Instalar dependências principais
npm install mysql2 cors dotenv jsonwebtoken

# Instalar dependência de desenvolvimento
npm install --save-dev nodemon

🗄️ 2. Configuração do Banco de Dados

Inicie o XAMPP ou WampServer e abra o phpMyAdmin.

Crie e importe os bancos de dados:

db_registagro

db_agt

Configure as credenciais do banco de dados no arquivo .env:

SERVER_PORT=3000
HOST="localhost"
USER='root'
PASSWORD=''
DATABASE1='db_registagro'
DATABASE2='db_agt'
DATABASE_PORT=3306
JWT_SECRET=chave_secreta

▶️ 3. Execução do Servidor
Modo de desenvolvimento:
npx nodemon src/server.js

Modo de produção:
node src/server.js


O servidor deverá iniciar em:
👉 http://localhost:3000

🔍 4. Testes da API

Para testar as rotas da API, utilize ferramentas como:

Insomnia

Postman

Exemplo de teste GET:

GET http://localhost:3000/api/usuarios

💡 Dicas

Sempre verifique se o MySQL está ativo antes de iniciar o servidor.

Mantenha o arquivo .env fora do controle de versão (.gitignore).

Utilize console.log() para verificar se a conexão com o banco foi bem-sucedida.