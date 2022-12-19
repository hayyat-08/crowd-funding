import axios from "axios";

axios.defaults.baseURL = "http://localhost:3001";

export const ApiHandler = (endpoint, method, data = null) => {
  return axios({
    url: endpoint,
    method: method,
    data: data,
  });
};
