const express = require('express') 
const routes = require('./routes')
const cors = require('cors');

const server = express()

server.use(express.json());
server.use(cors());
server.use(express.urlencoded({ extended:true }))
server.use(routes)

server.listen(5000);