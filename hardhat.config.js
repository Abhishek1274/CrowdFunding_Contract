require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ethers");
require("@nomicfoundation/hardhat-verify");
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.20",
  networks:{
    sepolia:{
      url:"https://eth-sepolia.g.alchemy.com/v2/BvIlHo1i6ZdZTToioXDijeP74OnyrEgg",
      accounts: [`0x${"482828ff2b1b8da6bebf5dfd38f94ded9fd6942fb47cc95b4ff708b581c5cfa0"}`]
    },
  },
  etherscan:{
    apiKey:"Q4X9IC9USUFAXNPUH4DIZUXZWD95939AAI",
  },
};
