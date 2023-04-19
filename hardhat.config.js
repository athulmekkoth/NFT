

require('dotenv').config();
require('@nomicfoundation/hardhat-toolbox');

const API_URL = process.env.API_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;
const API_KEY=process.env.API_KEY

console.log("API_URL:", API_URL);
console.log("PRIVATE_KEY:", PRIVATE_KEY);
console.log("API_KEY:", API_KEY);
module.exports = {
  solidity: "0.8.18",
  networks: {
    sepolia: {
      url: API_URL, 
      accounts:[PRIVATE_KEY],
    },
  }
}