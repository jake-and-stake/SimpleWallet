// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract ExceptionExample {
    mapping(address => uint64) public balanceReceived;

    function receiveMoney() public payable {
        assert(msg.value == uint64(msg.value));
        balanceReceived[msg.sender] += uint64(msg.value);
        assert(balanceReceived[msg.sender] >= msg.value);
    }

    function withdrawMoney(address payable _to, uint64 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Nope");
        assert(balanceReceived[msg.sender] - _amount <= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}

contract WillThrow {
    function aFunction() public pure {
        require(false, "Error Message");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    function catchError() public {
        WillThrow will = new WillThrow();
        try will.aFunction() {
            // It worked! Do something here
        } catch Error(string memory reason) {
            emit ErrorLogging(reason);
        }
    }
}