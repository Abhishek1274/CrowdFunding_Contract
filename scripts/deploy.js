const { ethers } = require("hardhat");

async function main() {
  // Deploy the ERC721 contract
  const crowdfunding = await ethers.getContractFactory("Factory");
  const Crowdfunding = await crowdfunding.deploy(); // Pass the arguments

  //await Abhisheknft.deployed();

  console.log("CrowdFunding contract is deployed to:", Crowdfunding.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });