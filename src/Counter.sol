// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "openzeppelin/token/ERC1155/extensions/ERC1155Burnable.sol";

contract Counter is ERC1155Burnable {
    int256 internal number;

    // TODO: metadata plan
    constructor() ERC1155("https://game.example/api/item/{id}.json") {}

    function mint() public {
        _mint(msg.sender, 0, 1, "");
    }

    function getNum() public view returns (int256) {
        return number;
    }
}
