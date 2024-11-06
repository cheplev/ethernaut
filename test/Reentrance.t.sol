// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Reentrance} from "../src/Reentrance.sol";
import {ReentranceAttacker} from "../src/ReentranceAttacker.sol";
import {Test} from "forge-std/Test.sol";

contract ReentranceScript is Test {
    Reentrance target;
    ReentranceAttacker attacker;

    function setUp() public {
        target = new Reentrance();
        attacker = new ReentranceAttacker(address(target));
    }

    function testAttackIsSuccess() public {
        attacker.attack{value: 1 ether}();
        uint256 finalBalance = address(target).balance;
        assertEq(finalBalance, 0);
    }
}