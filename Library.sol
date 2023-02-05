// SPDX-License-Identifier: MIT;
pragma solidity 0.8.7;

library Math {
    function max(uint x, uint y) internal pure returns (uint) {
        return x >= y ? x : y;
    }
}

contract Test {
    function testMax(uint x, uint y) external pure returns (uint) {
        return Math.max(x, y);
    }
}

library ArrayLib {
    // Lib functions must be internal, no point to be private or public as they are used inside contracts only
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
}

contract TestArray {
    using ArrayLib for uint[];
    uint[] public arr = [1, 2, 3];

    function testFind() external view returns (uint) {
        // 1) Approach:
        // return ArrayLib.find(arr, 2);

        // 2) Approach - Enhance data type; Better approach for production
        return arr.find(2);
    }
}
