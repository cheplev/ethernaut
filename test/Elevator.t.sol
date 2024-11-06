// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Elevator} from "../src/Elevator.sol";
import {ElevatorAttacker} from "../src/ElevatorAttacker.sol";
import {Test, console} from "forge-std/Test.sol";

contract ElevatorTest is Test {
    Elevator target;
    ElevatorAttacker attacker;

    function setUp() public {
        target = new Elevator();
        attacker = new ElevatorAttacker(address(target));
    }

    function testReachLastFloor() public {
        bool initialTop = target.top();
        console.log("initialTop", initialTop);
        attacker.attack();
        bool finalTop = target.top();
        console.log("finalTop", finalTop);  
        assertTrue(!initialTop && finalTop);
    }
}
