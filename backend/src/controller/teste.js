class Teste {
    async teste(req, res){
        res.status(200).json("Hello World!!!")
    }
}

export default new Teste()
