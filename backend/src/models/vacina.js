const db = require('../config/db');

module.exports = {
    async findVacina(id) {
        console.log(id);
        let query = `SELECT * FROM vacinas WHERE animal_id = ${id}`;
        try {
            const results = await db.query(query);
            return results.rows
        } catch (error) {
            return console.error(error)
        }
    },
    async listAll() {
        let query = `SELECT * FROM vacinas`;
        try {
            const results = await db.query(query);
            return results.rows
        } catch (error) {
            return console.error(error)
        }
    },
}