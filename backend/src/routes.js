const express = require('express');
const AnimalController = require('../src/controllers/animaisController')
const UserController = require('../src/controllers/userController')

const routes = express.Router()

// ======================= HOME ==============================
routes.get('/', (req, res) => {
    return res.send({message: 'oi'})
});

// ======================= ANIMAIS ==============================

routes.get('/animal/list', AnimalController.listAll);
routes.get('/animal/:id', AnimalController.findOne);
routes.post('/animal/create', AnimalController.create);
//routes.put('/animal/:id', AnimalController.update);
//routes.delete('/animal/:id', AnimalController.delete);

// ======================= USUÁRIOS ==============================

routes.post('/usuario/validate', UserController.findOne);
routes.post('/usuario/create', UserController.create);

module.exports = routes;