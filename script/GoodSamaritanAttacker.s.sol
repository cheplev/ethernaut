// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {GoodSamaritan} from "../src/GoodSamaritan.sol";
import {GoodSamaritanAttacker} from "../src/GoodSamaritanAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract GoodSamaritanAttackerScript is Script {
    GoodSamaritan target;
    GoodSamaritanAttacker attacker;

    function run() public {
        vm.startBroadcast();
        target = GoodSamaritan(0x0);
        attacker = new GoodSamaritanAttacker(address(target));
        attacker.attack();
        vm.stopBroadcast();
    }
}
