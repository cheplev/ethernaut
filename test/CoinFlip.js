const {expect } = require("chai");
const { ethers } = require("hardhat");

describe('CoinFlip', () => {
    
    beforeEach(async () => {
        const CoinFlipFactory = await ethers.getContractFactory('CoinFlip');
        coinFlip = await CoinFlipFactory.deploy();
        await coinFlip.deployed();
    })

    it('should be deployed with 0 consecutiveWins', async () => {
        expect(coinFlip.address).to.be.properAddress
        let consecutiveWins = await coinFlip.consecutiveWins()
        expect(consecutiveWins).to.be.eq(0);
    }) 

    it('should flip', async () => {
        
    })

})