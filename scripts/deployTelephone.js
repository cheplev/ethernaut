const { ethers } = require("hardhat");

async function main() {
  const TelephoneFactory = await ethers.getContractFactory("TelephoneAttacker");

  // here we deploy the contract
  const deployedTelephoneContract = await TelephoneFactory.deploy();

  // Wait for it to finish deploying
  await deployedTelephoneContract.deployed();

  await deployedTelephoneContract.changeOwner();

  // print the address of the deployed contract
  console.log("Telephone Contract Address:", deployedTelephoneContract.address);
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });