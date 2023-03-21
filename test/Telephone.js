const {expect } = require("chai");
const { ethers } = require("hardhat");

describe("Telephone", () => {
    let acc1
    let acc2
    let acc3
    
    beforeEach(async () => {
        [acc1, acc2, acc3] = await ethers.getSigners()
        const telephoneFactory = await ethers.getContractFactory("Telephone")
        telephone = await telephoneFactory.deploy()
        await telephone.deployed()
    })

    it("should be deployed", async () => {
        console.log('success!')
        expect(telephone.address).to.be.properAddress
    })
    
    it("should change an owner", async () => {
        console.log('ownerBefore', await telephone.owner())
        console.log('acc1', acc1.address)
        console.log('acc3', acc3.address)
        await telephone.connect(acc2).changeOwner(acc3.address)
        console.log('ownerAfter', await telephone.owner())

    })

})