pragma solidity ^0.4.4;
import "./User.sol";
import "./CarTrade.sol";
import "./HouseTrade.sol";

/** @title Shape Buyer contract. */
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
  /** @dev withdraw the amount recieved from a buyer and sends it to the seller
  * @param _withdrawAmount the amount of ether to be sent for the selller
  * @param _receiver the address of seller
  * @return _withdrawAmount The amount to be sent for the selller
  */
  function withdrawToBuyCar(uint _withdrawAmount, address _receiver) public  payable returns (uint) {
        if (buyersBalance[msg.sender] < _withdrawAmount) return;
        buyersBalance[msg.sender] -= _withdrawAmount;
        sellersBalance[_receiver] += _withdrawAmount;
        return (_withdrawAmount);
  }

  function getBalanceOfBuyer(address _accountAddress)  public  payable returns (uint){
    return(buyersBalance[_accountAddress]);
  }

}
