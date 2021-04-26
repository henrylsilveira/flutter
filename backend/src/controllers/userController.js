const User = require('../models/user')

module.exports = {
    async findOne(req, res) {
        try {
            console.log(req.body)
            const results = await User.findByEmail(req.body);
            if(results){
                console.log("OK")
                return res.status(201).send("Validado")
            }else{
                console.log("Senha Incorreta!")
                return res.status(400).send("Senha incorreta.")
            }
        } catch (error) {
            return console.error(error)
        }
    },
    async create(req, res) {
        const data = req.body
        try {
            await User.create(data)
            return res.status(200).send("Cadastrado!")
        } catch (error) {
            return console.error(error)
        }
    },
    async update() {
        let query = "UPDATE animal SET"

        Object.keys(fields).map((key, index, array) => {
            if((index + 1) < array.length) {
                query = `${query} ${key} = '${fields[key]}',`
            } else {
                query = `${query} ${key} = '${fields[key]}' WHERE id = ${id}`
            }
        })

        try {
            await db.query(query)
            return
        } catch (error) {
            return console.error(error)
        }
    }
}