import axios from "axios"

export default axios.create({
	baseURL: "http://" + process.env.WEB_SERVER_HOST + "/app",
	headers: {
		"Content-type": "application/json"
	}
})
