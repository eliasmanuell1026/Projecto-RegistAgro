import UserModel from '../model/usuarios.js'

class UserController{
    async verificarNIF(req, res){
        const nif = req.body

        try {
            const nifAnswer = await UserModel.verifyNIF(nif)
            
            if(nifAnswer.data){
                res.status(200).json(nifAnswer.data[0])
            }else{
                res.status(404).json(nifAnswer)
            }
            
        } catch (error) {
            res.status(500).json({error: error})
        }
    }

    async inscreverEmpresas(req, res){
        const dados = req.body
        
        try {
            const companyData = await UserModel.inscreverEmpresas(dados)
            
            if(companyData.message){
                res.status(201).json(companyData)
            }else{
                res.status(400).json(companyData)
            }

        } catch (error) {
            res.status(500).json({error: error})
        }
    }

    async login(req, res){
        const dados = req.body

        try {
            const loginData = await UserModel.login(dados)
            
            if(loginData.error){
                res.status(400).json(loginData.error)
            }else{
                res.set("Authorization", `Bearer ${loginData.token}`)
                res.status(200).json(loginData.message)
            }
        } catch (error) {
            res.status(500).json({error: error})
        }
    }
}

export default new UserController()
