import { Router } from "express"
import Teste from '../controller/teste.js'

const router = Router()

router.get('/', Teste.teste)


export default router
