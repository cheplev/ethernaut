// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "../src/Telephone.sol";
import {TelephoneAttacker} from "../src/TelephoneAttacker.sol";
import {Test, console} from "forge-std/Test.sol";

contract TelephoneTest is Test {
    Telephone target;
    TelephoneAttacker attacker;
    address USER = makeAddr("user");

    constructor() {
        target = new Telephone();
        attacker = new TelephoneAttacker(address(target));
    }

    function testAttackChangeOwner() public {
        address initialOwner = target.owner();
        console.log(initialOwner);
        vm.prank(USER);
        attacker.attack(USER);

        address ownerAfterAttack = target.owner();
        console.log(ownerAfterAttack);

        assertEq(ownerAfterAttack, USER);
    }
}
