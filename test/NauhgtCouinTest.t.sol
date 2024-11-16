// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {NaughtCoin} from "../src/NaughtCoin.sol";
import {NaughtCoinAttacker} from "../src/NaughtCoinAttacker.sol";
import {Test, console} from "forge-std/Test.sol";

contract NaughtCoinTest is Test {
    NaughtCoin target;
    NaughtCoinAttacker attacker;
    address USER = makeAddr("user");

    function setUp() public {
        vm.deal(USER, 1 ether);
        vm.startPrank(USER);
        target = new NaughtCoin(USER);
        attacker = new NaughtCoinAttacker(address(target));
        vm.stopPrank();

    }

    function testApproveAllowSendMoneyWhileTokensAreLocked() public {
        vm.startPrank(USER);
        target.approve(address(attacker), target.balanceOf(address(USER)));
        attacker.attack();
        uint256 endBalance = target.balanceOf(USER);
        vm.stopPrank();

        assertEq(endBalance, 0);
    }

    function testWithdrawWorks() public {
        address NEW_USER = makeAddr("new_user");
        vm.startPrank(USER);
        target.approve(address(attacker), target.balanceOf(address(USER)));
        attacker.attack();
        attacker.withdraw(NEW_USER);
        vm.stopPrank();

        console.log(target.balanceOf(NEW_USER));
    }

}
// 1000000000000000000000000
// 1000000000000000000000000