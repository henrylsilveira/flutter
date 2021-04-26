const db = require('../config/db')
const { hash, compare } = require('bcryptjs')

module.exports = {
    async findByEmail(data){
        const { email, senha } = data
        let query = `SELECT * FROM users WHERE email = '${email}'`
        const results = await db.query(query)
        const passed = await compare(senha, results.rows[0].password)
        console.log(passed)
        if(!passed){
            return false
        } else{
            return true
        }
    },
    async create(data) {
        try {
            const query = `
            INSERT INTO users ( nome, email, password )
            VALUES ( $1, $2, $3)
            RETURNING id
        `
        //HASH OF PASSWORD -- CRIPTOGRAFIA DE SENHA
        const passwordHash = await hash(data.password, 8)

        
        const values = [
            data.nome,
            data.email,
            passwordHash
        ]

        const results = await db.query(query, values);

        return results.rows[0].id
        } catch (err) {
            console.error(err)
        }
        
    },
    async update(id, fields) {
        let query = "UPDATE users SET"

        Object.keys(fields).map((key, index, array) => {
            if((index + 1) < array.length) {
                query = `${query} ${key} = '${fields[key]}',`
            } else {
                query = `${query} ${key} = '${fields[key]}' WHERE id = ${id}`
            }
        })

        await db.query(query)
        return
    }
}