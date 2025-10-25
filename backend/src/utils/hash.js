import bcrypt from 'bcrypt'

const salt = 10

class PasswordHash{
    async generateHash(password){
        try {
            const hash = await bcrypt.hash(password, salt)
            return hash
        } catch (error) {
            return {error: error}
        }
    }

    async compareHash(password, hash){
        try {
            const isValidPassword = await bcrypt.compare(password, hash)
            return isValidPassword

        } catch (error) {
            return {error: error}
        }
    } 
}

export default new PasswordHash()
