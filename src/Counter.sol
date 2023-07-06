// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    int256 internal number;

    function getNumber() public view returns (int256) {
        return number;
    }
}
