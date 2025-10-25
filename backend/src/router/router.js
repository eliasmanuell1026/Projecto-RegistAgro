import { Router } from "express"
import UserController from '../controller/usuarios.js'

const router = Router()

router.get('/nif', UserController.verificarNIF)
router.post('/inscreverEmpresas', UserController.inscreverEmpresas)
router.get('/login', UserController.login)

export default router
