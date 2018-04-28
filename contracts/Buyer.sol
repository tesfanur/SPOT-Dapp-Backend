pragma solidity ^0.4.4;
import "./User.sol";
import "./CarTrade.sol";
import "./HouseTrade.sol";

contract Buyer {
  CarTrade CarInfo;
  HouseTrade HouseInfo;
  User UserProfile;

  function userLogin()
  public constant returns (address, bytes32 username) {

   return (UserProfile.login(msg.sender));

  }
  /* function sendRequestToByCar() public {

  } */

}
