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
  function deposit() payable {
    balances[msg.sender] += msg.value;
  }
  // Withdraw the given amount from the account
  function withdraw(uint amount) payable {
    // Skip if withdraw is valid
    require(balances[msg.sender] >= amount && amount > 0);
    // Withdraw the given amount from the account
    balances[msg.sender] -= msg.value;
    msg.sender.transfer(amount);
  }
  // Destructor
  function remove() {
    if (msg.sender == owner){
      selfdestruct(owner);
    }
  }
}
