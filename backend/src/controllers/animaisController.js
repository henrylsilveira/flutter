const Animal = require('../models/animal')

module.exports = {
    async findOne(req, res) {
        const { id } = req.query
        try {
            const results = await Animal.findOne(id);
            return res.json(results)
        } catch (error) {
            return console.error(error)
        }
    },
    async listAll(req, res) {
        try {
            const results = await Animal.listAll();
            if(results){
                console.log("OK")
                return res.status(200).json(results)
            }else{
                console.log("Senha Incorreta!")
                return res.status(400).send("Erro!")
            }
        } catch (error) {
            return console.error(error)
        }
    },
    async create(req, res) {
        const data = req.body
        console.log(data)
        try {
            const results = await Animal.create(data)
            if(results){
                console.log("OK")
                return res.status(201).send("Cadastrado")
            }else{
                console.log("Senha Incorreta!")
                return res.status(400).send("Erro!")
            }
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
    },
    async delete(id) {
        let query = "DELETE FROM animal WHERE id = ${id}"
        try {
            await db.query(query)
            return
        } catch (error) {
            return console.error(error)
        }
    },
}