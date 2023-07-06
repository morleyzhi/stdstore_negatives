// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    using stdStorage for StdStorage;
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function testPositive() public {
        stdstore.target(address(counter)).sig("getNum()").checked_write(20);
        assertEq(counter.getNum(), 20, "Can set to positive number");
    }

    function testNegative() public {
        // Build error:
        // Member "checked_write" not found or not visible after argument-dependent lookup in struct StdStorage storage pointer.
        stdstore.target(address(counter)).sig("getNum()").checked_write(-2159);
        assertEq(counter.getNum(), -2159, "Can set to negative number");
    }
}
