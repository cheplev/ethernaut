// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GoodSamaritan} from "../src/GoodSamaritan.sol";
import {GoodSamaritanAttacker} from "../src/GoodSamaritanAttacker.sol";
import {Test, console} from "forge-std/Test.sol";
import {Coin} from "../src/GoodSamaritan.sol";
import {Wallet} from "../src/GoodSamaritan.sol";


contract GoodSamaritanTest is Test {
    GoodSamaritan target;
    GoodSamaritanAttacker attacker;
    Coin coin;
    Wallet wallet;

    address attackerAddress = address(1);

    function setUp() public {
        vm.prank(attackerAddress);
        target = new GoodSamaritan();
        coin = target.coin();
        wallet = target.wallet();
        attacker = new GoodSamaritanAttacker(address(target));
    }

    function testAttackCanDrainWallet() public {
        uint256 initialBalance = coin.balances(address(attacker));
        attacker.attack();
        uint256 endBalance = coin.balances(address(attacker));
        console.log("initialBalance", initialBalance);
        console.log("endBalance", endBalance);
    }

}