// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Denial} from "../src/Denial.sol";
import {DenialAttacker} from "../src/DenialAttacker.sol";
import {Test, console} from "forge-std/Test.sol";

contract CoinFlipAttackerTest is Test {
    Denial target;
    DenialAttacker attacker;

    function setUp() public {
        target = new Denial();
        attacker = new DenialAttacker(payable(address(target)));
    }


    function testAttackerCanBrakeContract() public {
        uint256 ownerBalanceBefore = address(target.owner()).balance;
        attacker.attack();
        uint256 ownerBalanceAfter = address(target.owner()).balance;
        assertEq(ownerBalanceBefore, ownerBalanceAfter);
    }
}