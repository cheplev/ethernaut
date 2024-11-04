// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "../src/CoinFlip.sol";
import {CoinFlipAttacker} from "../src/CoinFlipAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract CoinFlipAttackerScript is Script {
    CoinFlip target;
    CoinFlipAttacker attacker;

    function run() public {
        target = CoinFlip(0x7Cd9366f988eaB0764ff967C6f2799Dc757bb9A5);
        vm.startBroadcast();
        attacker = new CoinFlipAttacker(address(target));
        attacker.attack();
        vm.stopBroadcast();
    }
}
