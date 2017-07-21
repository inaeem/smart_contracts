pragma solidity ^0.4.11;

import "owned";
contract mortal is owned {
    // Borrow functionality from owned contract to implement destructor
    // Only owner of the contract can call this functionality
    function kill() {
        if (isOwner()){
            selfdestruct(owner);
        }
    }
}
