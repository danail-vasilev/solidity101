// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract TestCall {
    string public message;
    uint public x;

    event Log(string message);

    fallback() external payable {
        emit Log("fallback was called");
    }

    function foo(
        string memory _message,
        uint _x
    ) external payable returns (bool, uint) {
        message = _message;
        x = _x;
        return (true, 999);
    }
}

contract Call {
    bytes public data;

    // Call failes because gas is too low, remove gas limit to have a success
    function callFoo(address _address) external payable {
        (bool success, bytes memory _data) = _address.call{
            value: 111,
            gas: 5000
        }(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));
        require(success, "call failed");
        data = _data;
    }

    // To fail delete the fallback function from TestCall contract
    function callDoesNotExist(address _address) external {
        (bool success, bytes memory _data) = _address.call(
            abi.encodeWithSignature("doesNotExist()")
        );
        require(success, "call failed");
    }
}
