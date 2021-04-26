const db = require('../config/db')

module.exports = {
    async findOne(id) {
        let query = `SELECT * FROM animal WHERE user_id= ${id}`;

        try {
            const results = await db.query(query);
            return results.rows
        } catch (error) {
            return console.error(error)
        }
    },
    async listAll() {
        let query = `SELECT * FROM animal`;

        try {
            const results = await db.query(query);
            return results.rows
        } catch (error) {
            return console.error(error)
        }
    },
    async create(data) {
        const query = `
            INSERT INTO animal ( nome, raca, user_id )
            VALUES ( $1, $2, $3)
            RETURNING id
        `

        const values = [
            data.nome,
            data.raca,
            data.user_id
        ]

        try {
            const results = await db.query(query, values);
            return results.rows[0].id
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