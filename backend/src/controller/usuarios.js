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
}

export default new UserController()
