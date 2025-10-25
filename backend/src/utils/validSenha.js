export function senhaValida(senha) {
    const numeros = /\d/
    const simbolo = /[!@#$%^&*(),.?":{}|<>]/
    const maiuculas = /[A-Z]/
    const minusculas = /[a-z]/

    if(senha.length >= 8){
        if(minusculas.test(senha) || maiuculas.test(senha) && numeros.test(senha) || simbolo.test(senha))
            return true
        return false
        
    }
    return false
}
