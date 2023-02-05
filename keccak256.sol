// SPDX-License-Identifier: MIT;
pragma solidity 0.8.7;

contract Keccak256 {
    function hash(
        string memory text,
        uint num,
        address addr
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    function encode(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encode(text0, text1);
    }

    function encodePacked(
        string memory text0,
        string memory text1
    ) external pure returns (bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    // Dynamic data with encodePacked leads to collision
    // text0 = "AAAA", text1 = "BBB"  =>  0x41414141424242
    // text0 = "AAA",  text1 = "ABBB" =>  0x41414141424242
    function collision(
        string memory text0,
        string memory text1
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, text1));
    }

    // Fix either by using abi.encode() or place a param between dynamic data params
    function fixCollision(
        string memory text0,
        string memory text1,
        uint x
    ) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}
