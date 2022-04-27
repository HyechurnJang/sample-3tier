const express = require("express")
const app = express()
var cors = require("cors")
const dotenv = require("dotenv")
const data = require("./db/hanlder.js")

dotenv.config()

const port = process.env.WAS_PORT
const web_server_host = process.env.WEB_SERVER_HOST

var whitelist = [web_server_host]

var corsOptionsDelegate = function (req, callback) {
	var corsOptions
	if (whitelist.indexOf(req.header("Origin")) !== -1) {
		corsOptions = {origin: true} // reflect (enable) the requested origin in the CORS response
	} else {
		corsOptions = {origin: false} // disable CORS for this request
	}
	callback(null, corsOptions) // callback expects two parameters: error and options
}

console.log()

app.use(express.json())

app.get("/healthz", (req, res) => {
	res.status(200).send({status: "OK"})
})

// get all users
app.get("/users", cors(corsOptionsDelegate), (req, res) => {
	if (req.query.name != null) {
		data
			.findByName(req.query.name)
			.then((response) => {
				res.status(200).send(response)
			})
			.catch((error) => {
				res.status(500).send(error)
			})
	} else {
		data
			.listUsers()
			.then((response) => {
				res.status(200).send(response)
			})
			.catch((error) => {
				res.status(500).send(error)
			})
	}
})

// get user by id
app.get("/users/:id", cors(corsOptionsDelegate), (req, res) => {
	data
		.getUserByID(req.params["id"])
		.then((response) => {
			res.status(200).send(response)
		})
		.catch((error) => {
			res.status(500).send(error)
		})
})

// create user
app.post("/users", cors(corsOptionsDelegate), (req, res) => {
	data
		.createUser(req.body)
		.then((response) => {
			res.status(200).send(response)
		})
		.catch((error) => {
			res.status(500).send(error)
		})
})

// update user
app.put("/users/:id", cors(corsOptionsDelegate), (req, res) => {
	data
		.updateUser(req.params["id"], req.body)
		.then((response) => {
			res.status(200).send(response)
		})
		.catch((error) => {
			res.status(500).send(error)
		})
})

app.delete("/users/:id", cors(corsOptionsDelegate), (req, res) => {
	data
		.deleteUser(req.params["id"])
		.then((response) => {
			res.status(200).send(response)
		})
		.catch((error) => {
			res.status(500).send(error)
		})
})

app.delete("/users", cors(corsOptionsDelegate), (req, res) => {
	data
		.deleteAllUsers()
		.then((response) => {
			res.status(200).send(response)
		})
		.catch((error) => {
			res.status(500).send(error)
		})
})

app.listen(port, () => {
	console.log(`Simple app server running on port ${port}.`)
})
