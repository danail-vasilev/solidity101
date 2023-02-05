// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract CallTestContract {
    function setX(address _testAddress, uint _x) external {
        TestContract(_testAddress).setX(_x);
    }

    function setX2(TestContract _testContract, uint _x) external {
        _testContract.setX(_x);
    }

    function getX(TestContract _testContract) external view returns (uint) {
        return _testContract.getX();
    }

    function setXandRetrieveEther(
        TestContract _testContract,
        uint _x
    ) external payable {
        _testContract.setXandRetrieveEther{value: msg.value}(_x);
    }

    function getXandValue(
        TestContract _testContract
    ) external view returns (uint, uint) {
        return _testContract.getXandValue();
    }
}

contract TestContract {
    uint public x;
    uint public value;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandRetrieveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }
}
