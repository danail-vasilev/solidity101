//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

// Source:
// https://github.com/ensdomains/ens-contracts/blob/master/contracts/ethregistrar/StringUtils.sol
// https://betterprogramming.pub/in-the-world-of-javascript-finding-the-length-of-string-is-such-an-easy-thing-just-do-str-length-4b4b33dbed09

library StringUtils {
    /**
     * @dev Returns the length of a given string
     *
     * @param s The string to measure the length of
     * @return The length of the input string
     * Example: // if we do bytes("xyz"), solidity converts it as
     * xyz -> 78 79 7a // 78=x, 79=y, 7a=z // Length is 3, expected
     * ABC -> 41 42 43 // 41=A, 42=B, 43=C // Length is 3, expected
     * € -> e2 82 ac  // Length is again 3, while we suppose to be 1
     */
    function strlen(string memory s) internal pure returns (uint256) {
        uint256 len;
        uint256 i = 0;
        uint256 bytelength = bytes(s).length;
        for (len = 0; i < bytelength; len++) {
            bytes1 b = bytes(s)[i];
            if (b < 0x80) {
                i += 1;
            } else if (b < 0xE0) {
                i += 2;
            } else if (b < 0xF0) {
                i += 3;
            } else if (b < 0xF8) {
                i += 4;
            } else if (b < 0xFC) {
                i += 5;
            } else {
                i += 6;
            }
        }
        return len;
    }
}
