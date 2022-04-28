import axios from "axios"

export default axios.create({
	baseURL: "http://" + process.env.REACT_APP_WEB_SERVER_HOST + "/app",
	headers: {
		"Content-type": "application/json"
	}
})
