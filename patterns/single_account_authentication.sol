pragma solidity ^0.4.11;

// Basic authentication contract is abstract.
// Unlike 'owned' it also has an overloaded version that takes a param.
contract Auth {
    function isAdmin() constant returns (bool);
}

// Single account authentication keeps one authorized user (the admin)
// Implements the checks and also allows the admin to be changed (though only by the current admin).
contract SingleAccountAuth is Auth {
    // Only inheritor can set this property
    address admin;
    // Check if the caller is admin
    function isAdmin() constant returns (bool){
        return msg.sender == admin;
    }
    // Allow inheritor to set the administrator
    function setAdmin(address addr) constant returns (bool) {
        if (isAdmin()){
            admin = addr;
            return true;
        }
        return false;
    }
}

// Take the admin address as a constructor param.
contract AdminAuth is SingleAccountAuth {
    // Contructor
    function AdminAuth(address _admin){
        admin = _admin;
    }
}

// Set creator as admin (just like 'owned').
contract CreatorAuth is SingleAccountAuth {
    // Contructor
    function CreatorAuth(){
        admin = msg.sender;
    }
}
