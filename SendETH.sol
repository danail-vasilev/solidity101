// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// 3Ways to send ETH to contracts:
// transfer - 2300 gas, reverts
// send - 2300 gas, bool
// call - all gas, returns bool and data
contract SendETH {
    constructor() payable {}

    receive() external payable {}

    function sendViaTransfer(address payable _to) external payable {
        _to.transfer(123);
    }

    function sendViaSend(address payable _to) external payable {
        bool isSent = _to.send(123);
        require(isSent, "send failed");
    }

    function sendViaCall(address payable _to) external payable {
        (bool success, ) = _to.call{value: 123}("");
        require(success, "send failed");
    }
}

contract EthReceiver {
    event Log(uint amount, uint gas);

    receive() external payable {
        emit Log(msg.value, gasleft());
    }
}
