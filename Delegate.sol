// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Var names and order must be preserved for delegate calls
contract TestDelegateCall {
    // Adding a new var on top will create a different storage pointer and hence wrong behavior
    // address public owner;
    uint public num;
    address public sender;
    uint public value;

    // Adding a new var to the end is fine
    // address public owner;

    function setVars(uint _num) external payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract DelegateCall {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _address, uint _num) external payable {
        // 1) Approach
        // _address.delegatecall(
        //     abi.encodeWithSignature("setVars(uint256)", _num)
        // );

        // 2) Approach - this is better as no need to update signature if changed, also type safety, no string input
        (bool success, bytes memory data) = _address.delegatecall(
            abi.encodeWithSelector(TestDelegateCall.setVars.selector, _num)
        );
        require(success, "delegatecall failed");
    }
}
