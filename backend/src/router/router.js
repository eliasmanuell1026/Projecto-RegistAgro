import { Router } from "express"
import UserController from '../controller/usuarios.js'

const router = Router()

router.get('/nif', UserController.verificarNIF)

export default router
