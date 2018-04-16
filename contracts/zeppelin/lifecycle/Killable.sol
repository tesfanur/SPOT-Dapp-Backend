pragma solidity ^0.4.4;


import "./../ownership/Ownable.sol";


/*
 * Killable
 * Base contract that can be killed by owner. All funds in contract will be sent to the owner.
 */
contract Killable is Ownable {
  function kill() onlyOwner public{
    selfdestruct(owner);
  }
}
