// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "../src/CoinFlip.sol";
import {CoinFlipAttacker} from "../src/CoinFlipAttacker.sol";
import {Test, console} from "forge-std/Test.sol";


contract CoinFlipAttackerTest is Test {
    CoinFlip target;
    CoinFlipAttacker attacker;

    function setUp() public {
        target = new CoinFlip();
        attacker = new CoinFlipAttacker(address(target));
    }

    function testAttackIsSuccess() public {
        uint256 initialWins = target.consecutiveWins();

        for (uint256 i = 0; i < 10; i++) {
            attacker.attack();
            vm.warp(block.timestamp + 1);
            vm.roll(block.number + 1);
        }

        uint256 afterAttackWins = target.consecutiveWins();
        console.log(afterAttackWins);
        assertEq(initialWins, afterAttackWins - 10);
    }
}