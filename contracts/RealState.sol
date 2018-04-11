pragma solidity ^0.4.19;

contract RealState {
	address public seller;
	address public buyer;
	string public streetAddress;
	string title;
	uint256 public price;

  function RealState() public {
    // constructor
    //who is the selller?
    seller =msg.sender;
    //what is the title?
     title ="jdgdfnghfhg564wnpfkboianbk354";
    //wha is the street address?
    streetAddress ="Bulgaria, Addis Ababa, Ethiopia";
    //what is the price?
    price = 9900000000000;//99 ether

  }

	modifier canBuyOnIf() {
		//method 1:  put each buyer condition in a separate require statement
  	/* require(seller !=0x0);
  	require(buyer==0x0);
  	require(price ==msg.value); */
		//method 2: pass all buyer condition in one require statement
		require(seller!=0x0 &&
			buyer==0x0 &&
			price ==msg.value);
		_;

	}

  function buyHouse() payable public canBuyOnIf{
  	buyer = msg.sender;
  	seller.transfer(msg.value);
  }
}
