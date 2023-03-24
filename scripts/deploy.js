
const hre = require("hardhat");

async function main() {


  const NFT = await hre.ethers.getContractFactory("NFT");
  const nft = await NFT.deploy();

  await lock.deployed();

  console.log("deployed to",nft.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
