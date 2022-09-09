// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4.0;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) private uintUintBoolMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddress() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _index1, uint _index2, bool _value) public {
        uintUintBoolMapping[_index1][_index2] = _value;
    }

    function getUintUintBoolMapping(uint _index1, uint _index2) public view returns(bool) {
        return uintUintBoolMapping[_index1][_index2];
    }
}