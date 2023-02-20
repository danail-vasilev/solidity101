// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Arrays can be dynamic or fixed size
// Array operations:
// Insert(push), Get, Update, Delete, Pop & Length
// Creating Array in memory
// Returning Array from function
contract Arrays {
    uint[] public nums = [1, 2, 3];
    uint[3] public fixedNums = [4, 5, 6];

    function example() external {
        nums.push(4);
        // fixedNums.push(7); Not allowed as it's fixed
        uint x = nums[1]; // 2

        nums[2] = 777; // [1, 2, 777, 4]

        delete nums[1]; // [1, 0 , 777, 4]

        nums.pop(); // [1, 0, 777]

        uint[] memory memoryArray = new uint[](5);
        // memoryArray.pop(); // Memory can be only fixed size - no push or pop
        memoryArray[1] = 567;
    }

    function returnArray() external view returns (uint[] memory) {
        return nums; // Not recommended returning arrays; not gas efficient; can hit max gas per block
    }
}
