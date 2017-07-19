pragma solidity ^0.4.0;

// Simple bank account contract that lets people deposit and withdraw money (Ether)
contract Bank {
  // Owner of the contract who can destroy this contract
  address owner;
  // Registory to store people balances
  mapping (address => uint) balances;
  // Set contract owner
  function Bank() {
    owner = msg.sender;
  }
  // Add value of the transaction to the sender's account.
  function deposit() {
    balances[msg.sender] += msg.value;
  }
  // Withdraw the given amount from the account
  function withdraw(uint amount) {
    // Skip if withdraw is valid
    if (balances[msg.sender] < amount || amount == 0)
      return false;
    // Withdraw the given amount from the account
    balances[msg.sender] -= msg.value;
    msg.sender.send(amount);
  }
  // Destructor
  function remove() {
    if (msg.sender == owner){
      selfdestruct(owner);
    }
  }
}
