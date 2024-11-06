// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Elevator} from "../src/Elevator.sol";
import {ElevatorAttacker} from "../src/ElevatorAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract ElevatorAttackerScript is Script {
    Elevator target;
    ElevatorAttacker attacker;

    function run() public {
        target = Elevator(0xEf43b3a449B3B97059c2c8803A3cf10C391739c8);
        vm.startBroadcast();
        attacker = new ElevatorAttacker(address(target));
        attacker.attack();
        vm.stopBroadcast();
    }

}