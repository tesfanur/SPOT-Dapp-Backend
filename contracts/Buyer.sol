 pragma solidity ^0.4.19;
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
  mapping (address => uint) public buyersBalance;
  mapping (address => uint) public sellersBalance;

  /* function sendRequestToByCar() public {

  } */
  /** @dev withdraw the amount recieved from a buyer and sends it to the seller
  * @param _amountToPay the amount of ether to be sent for the selller
  * @param _seller the address of seller
  * @return _amountToPay The amount to be sent for the selller
  */

  function payCarOwner(uint _amountToPay, address _seller) public  payable returns (uint,uint) {
        if (buyersBalance[msg.sender] < _amountToPay) return;
        buyersBalance[msg.sender] -= _amountToPay;
        sellersBalance[_seller] += _amountToPay;
        return (buyersBalance[msg.sender],sellersBalance[_seller]);
        //return (_withdrawAmount,_seller);
  }
  function returnSenderAccount() public  payable returns (address,uint) {

        return (msg.sender,sellersBalance[msg.sender] );
  }

  function getBalanceOfBuyer(address _accountAddress)  public  payable returns(uint){
    return(buyersBalance[_accountAddress]);
  }

  function getIntValue(uint _intvalue)  public pure returns(uint){
    return(_intvalue);
  }

  function getBalanceOfSeller(address _accountAddress)  public  payable returns(uint){
    return(buyersBalance[_accountAddress]);
  }
  //=============================
      /* address owner;
      mapping (address => uint) balances;
      // Constructor
      function Buyer() internal {
      owner = msg.sender;
      } */
  // This will take the value of the transaction and add to the senders account.
  function deposit(address customer) public payable returns (bool res) {
  // If the amount they send is 0, return false.
  if (msg.value == 0){
  return false;
  }
  buyersBalance[customer] += msg.value;
  return true;
  }
  // Attempt to withdraw the given 'amount' of Ether from the account.
  function withdraw(address seller, uint carPrice) public returns (uint) {
  // Skip if someone tries to withdraw 0 or if they don't have
  // enough Ether to make the withdrawal.
  if (buyersBalance[msg.sender] < carPrice || carPrice == 0)
  return 0;
  //balances[buyer] -= carPrice;
  buyersBalance[msg.sender]  += carPrice;
  sellersBalance[seller] += carPrice;
  msg.sender.transfer(carPrice);
  address(this).transfer(carPrice);
  return(carPrice);
  //return true;
  }

  function buySmartCar(address buyer,address seller,  uint amount) public {
      uint smartCarPrice= withdraw(buyer, amount);
      //balances[seller] += smartCarPrice;
      sellersBalance[seller]+= smartCarPrice;
      buyersBalance[seller]-= smartCarPrice;
  }

  function remove() public {
  if (msg.sender == owner){
  selfdestruct(owner);
  }
  }

  /* //fallback function to enable this contract to receive ether from other account
  function () public payable {
  } */
  //fallback function to enable this contract to receive ether from other account
  function receiveEther() public payable {
  }
    /* //get balance of this contract
    function contractBalance() public returns (uint) {
      return(address(this).getBalance());
    } */

    function getContractBalance() public view returns (uint) {

      return(address(this).balance);

    }
    //transfer all ether deposited by this contract to another account address
    //10 ether: 10000000000000000000
    function transferTo(address _to,uint _transferAmount) public returns (uint) {
      //transfer contract balance to another account address
        //_to.transfer(address(this).balance);
        _to.transfer(_transferAmount);
        return(address(this).balance);

    }

}
