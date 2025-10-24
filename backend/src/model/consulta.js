import registagroConection from "../database/registagroConection.js"
import agtConection from '../database/agtConection.js'


class Query {
    registagroQuery(query, data='', registagroErrorMesage){
        return new Promise((resolve, reject) =>{
            registagroConection.query(query, data, (error, ok) =>{
                if(error)
                    return reject(registagroErrorMesage)
                return resolve(JSON.parse(JSON.stringify(ok)))
            })
        })
    }

    agtQuery(query, data='', agtErrorMesage){
        return new Promise((resolve, reject) =>{
            agtConection.query(query, data, (error, ok) =>{
                if(error){
                    return reject(agtErrorMesage)
                }
                return resolve(JSON.parse(JSON.stringify(ok)))
            })
        })
    }
}

export default new Query()
