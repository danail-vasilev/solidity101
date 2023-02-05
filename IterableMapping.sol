// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract IterableMapping {
    mapping(address => uint) balances;
    mapping(address => bool) inserted;
    address[] keys;

    function getSize() external view returns (uint) {
        return keys.length;
    }

    function set(address _address, uint _balance) external {
        balances[_address] = _balance;
        if (!inserted[_address]) {
            inserted[_address] = true;
            keys.push(_address);
        }
    }

    function getValue(uint _index) external view returns (uint) {
        return balances[keys[_index]];
    }
}
