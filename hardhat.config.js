require('dotenv').config();
require('@nomicfoundation/hardhat-toolbox');

const API_URL = process.env.API_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

module.exports = {
  solidity: "0.8.18",
  networks: {
    goerli: {
      url: API_URL,
      accounts: [PRIVATE_KEY]
    },
  },
};
