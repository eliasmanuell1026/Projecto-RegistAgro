import Query from './consulta.js'

class UserModel{
    async verifyNIF(nif){
        try {
            const query = "SELECT nif, nome_empresa, tipo_empresa, email, localizacao, contacto FROM tb_empresas WHERE nif=?"
            const result = await Query.agtQuery(query, nif.nif, "Não foi possível carregar NIF")
            
            if(result.length == 0){
                return {
                    message: "ERROR: NIF inválido"
                }
            }
            
            return {
                data: result
            }
            
        } catch (error) {
            return {error: error}
        }
    }
}

export default new UserModel()
