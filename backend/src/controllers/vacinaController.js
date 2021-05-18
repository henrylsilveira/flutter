const vacina = require('../models/vacina');

module.exports = {
    async listVacina(req, res) {
        const { id } = req.query
        console.log(req.query);
        try {
            const results = await vacina.findVacina(id);
            return res.json(results)
        } catch (error) {
            return console.error(error)
        }
    },
    async listAll(req, res) {
        try {
            const results = await vacina.listAll();
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
}