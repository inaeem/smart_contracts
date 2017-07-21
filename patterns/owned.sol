pragma solidity ^0.4.11;

contract owned {
    // Store owner information
    address owner;
    // Contructor
    function owned() {
        owner = msg.sender;
    }
    // Check if caller is the owner of the contract
    function isOwner() constant returns (bool) {
        return msg.sender == owner;
    }
}
