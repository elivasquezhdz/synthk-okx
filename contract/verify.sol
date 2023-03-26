// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract verifyportal {
    uint256 totalVerifications;


    event NewVerify(address indexed from, uint256 timestamp, string message);


    struct Verify {
        address verifier; 
        string message; 
        uint256 timestamp; 
    }

    Verify[] verifications;

    constructor() {
        console.log("hello contracts!");
    }


    function verify(string memory _message) public {
        totalVerifications += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);


        verifications.push(Verify(msg.sender, _message, block.timestamp));


        emit NewVerify(msg.sender, block.timestamp, _message);
    }


    function getAllVerifications() public view returns (Verify[] memory) {
        return verifications;
    }

    function getTotalVerifications() public view returns (uint256) {

        console.log("We have %d total verifications!", totalVerifications);
        return totalVerifications;
    }
}
