const { ethers } = require("hardhat");

async function main() {
    const CoinFlipFactory = await ethers.getContractFactory("CoinFlipAttacker");

    // here we deploy the contract
    const deployedCoinFlip = await CoinFlipFactory.deploy();

    // Wait for it to finish deploying
    await deployedCoinFlip.deployed();

    await deployedCoinFlip.flip();
    // print the address of the deployed contract
    console.log("Telephone Contract Address:", deployedCoinFlip.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });