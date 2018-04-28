pragma solidity ^0.4.4;
import "./User.sol";
import "./CarTrade.sol";
import "./HouseTrade.sol";

contract Buyer is User {
  CarTrade CarInfo;
  HouseTrade HouseInfo;
  User public userProfile;
  //Seller public seller;

  //map buyers address with their balance
  mapping (address => uint) buyersBalance;
  mapping (address => uint) sellersBalance;

  /* function sendRequestToByCar() public {

  } */

  function withdrawToBuyCar(uint _withdrawAmount) public  payable returns (uint) {
        if (buyersBalance[msg.sender] < _withdrawAmount) return;
        buyersBalance[msg.sender] -= _withdrawAmount;
        sellersBalance[receiver] += _withdrawAmount;
        return (_withdrawAmount);
  }

}
