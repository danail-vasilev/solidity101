// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface ICounter {
    function count() external view returns (uint); // Add interface for public var as Solidity creates getter.

    function inc() external;

    function dec() external;
}

contract CallCounter {
    uint public count;

    function increaseCount(address _counter) external {
        ICounter(_counter).inc();
        count = ICounter(_counter).count();
    }
}
