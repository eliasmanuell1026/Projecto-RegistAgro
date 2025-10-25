import Query from './consulta.js'
import PasswordHash from '../utils/hash.js'
import { senhaValida } from '../utils/validSenha.js'
import jwt from 'jsonwebtoken'
import variaveis from '../config/variaveisGlobais.js'

class UserModel{
    async verifyNIF(nif){
        try {
            const query = [
                "SELECT nif, nome_empresa, tipo_empresa, email, localizacao, contacto FROM tb_empresas WHERE nif=?",
                "SELECT nif FROM tb_usuarios WHERE nif=?"
            ]
            const agtResult = await Query.agtQuery(query[0], nif.nif, "Não foi possível carregar NIF")
            
            if(agtResult.length == 0){
                return {
                    message: "ERROR: NIF inválido"
                }
            }

            try {
                const registagroResult = await Query.registagroQuery(query[1], nif.nif, "Não foi possível verificar NIF")
                
                if(registagroResult.length != 0){
                    return {
                        message: "ERROR: Este NIF já foi cadastrado, faça o login"
                    }
                }

                return {
                    data: agtResult
                }
                
            } catch (error) {
                return {error: error}
            }
            
        } catch (error) {
            return {error: error}
        }
    }

    async inscreverEmpresas(data){
        const query = [
            "INSERT INTO tb_usuarios (nif, nome, tipo, localizacao, contacto, email, senha) VALUES (?,?,?,?,?,?,?)",
            "SELECT nif FROM tb_usuarios WHERE nif=?" 
        ]

        try {
            if(senhaValida(data.senha)){
                //Gera a hash da senha
                const hashPasword = await PasswordHash.generateHash(data.senha)

                try {

                    //verifica se o nif já foi cadastrado 
                    const registagroResult = await Query.registagroQuery(query[1], data.nif, "Não foi possível verificar NIF")
                    
                    //se o nif já foi cadastrado então diz que já está cadastrado
                    if(registagroResult.length != 0){
                        return {
                            error: "ERRO: Este NIF já foi cadastrado, faça o login"
                        }
                    }

                    try {
                        //caso o nif não estar cadastrado ainda, faz o cadastro
                        await Query.registagroQuery(
                            query[0],
                            [data.nif, data.nome, data.tipo, data.localizacao, data.contacto, data.email, hashPasword],
                            "Dados inválidos, tente novamente"
                        )

                        return {
                            message: "Conta criada com sucesso"
                        }
                        
                    } catch (error) {
                        return {error: error}
                    }
                    
                } catch (error) {
                    return {error: error}
                }
            }

            return {error: "Senha inválida"}
            
        } catch (error) {
            return {error: error}
        }

    }

    async login(data){
        const query = "SELECT id, senha FROM tb_usuarios WHERE nif=?"

        try {
            //verificar nif
            const loginResult = await Query.registagroQuery(query, data.nif, "Ocorreu um erro ao efetuar o login")

            //se o nif existir vai verificar se a senha está correcta
            if(loginResult.length != 0){

                try {
                    //comparar a senha com a hash da senha
                    const senha = await PasswordHash.compareHash(data.senha, loginResult[0].senha)
                    
                    if(senha){

                        //gerar o token de acesso
                        const token = jwt.sign(
                            {userId: loginResult[0].id},
                            variaveis.jwt_key,
                            {expiresIn: "1d"}
                        )

                        return {
                            message: "Login efetuado com sucesso",
                            token: token
                        }
                    }

                    return {
                        error: "NIF ou senha inválidos"
                    }
    
                } catch (error) {
                    return {error: error}
                }
            }

            //se o nif não existir
            return {
                error: "NIF ou senha inválidos"
            }

        } catch (error) {
            return {error: error}
        }
    }
}

export default new UserModel()
