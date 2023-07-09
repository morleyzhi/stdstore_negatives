// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    using stdStorage for StdStorage;
    Counter public counter;

    address _addrSubject = makeAddr("_addrSubject");
    address _addrReceiver = makeAddr("_addrReceiver");

    function setUp() public {
        counter = new Counter();
    }

    function testMinting() public {
        vm.startPrank(_addrSubject);

        counter.mint();
        counter.safeTransferFrom(_addrSubject, _addrReceiver, 0, 1, "");
        assertEq(counter.balanceOf(_addrSubject, 0), 0);
        assertEq(counter.balanceOf(_addrReceiver, 0), 1);

        vm.stopPrank();
    }

    function testPositiveAndNegative() public {
        stdstore.target(address(counter)).sig("getNum()").checked_write(20);
        assertEq(counter.getNum(), 20, "Can set to positive number");

        stdstore.target(address(counter)).sig("getNum()").checked_write(
            uint(int(-2159))
        );
        assertEq(counter.getNum(), -2159, "Can set to negative number");
    }
}
