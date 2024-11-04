// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "../src/King.sol";
import {KingAttacker} from "../src/KingAttacker.sol";
import {Test, console} from "forge-std/Test.sol";

contract KingTest is Test {
    King target;
    KingAttacker attacker;
    address USER = makeAddr("user");
    address LEVEL = makeAddr("level");
    uint256 constant INITIAL_VALUE = 1e15;

    function setUp() public {
        vm.deal(LEVEL, 10 ether);
        vm.startPrank(LEVEL);
        target = new King{value: INITIAL_VALUE}();
        vm.stopPrank();
        attacker = new KingAttacker{value: 1 ether}(payable(address(target)), USER);
    }

    function testAttackBreakContract() public {
        address initialOwner = target.owner();
        
        (bool success, ) = address(target).call{value: INITIAL_VALUE}("");

        if (success) {
            uint256 balance = address(target).balance;

            vm.startPrank(LEVEL);
            vm.expectRevert();
            (bool success2, ) = address(target).call{value: INITIAL_VALUE * 2}("");
            vm.stopPrank();


        } else {
            revert("Something wrong");
        }
    }
}