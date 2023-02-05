// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external payable {
        require(msg.sender == owner, "caller not an owner");
        owner.transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
