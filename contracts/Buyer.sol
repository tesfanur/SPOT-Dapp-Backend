pragma solidity ^0.4.19;

contract Buyer {
  bytes32 name;
  bytes32 username;
  function Buyer() public{
    // constructor
  }

  function registerBuyer(bytes32 _name, bytes32 _username) public {
    name =_name;
  username =_username;
 }
 
}
