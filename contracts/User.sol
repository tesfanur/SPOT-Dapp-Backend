pragma solidity ^0.4.4;


contract User {

     //buyer || seller => Counterparty
	struct UserStruct {
		address addr;
		bytes32 firstName;
		bytes32 lastName;
		bytes32 email;
		bytes32 username;

	}

  UserStruct[] public users;

  function User() public {
    // constructor
  }

  function registerCounterparty
  (bytes32 _fName,
  bytes32 _lName,
  bytes32 _email,
  bytes32 _username) public payable returns(bool)  {
  	UserStruct memory counterparty;
  	counterparty.firstName=_fName;
  	counterparty.lastName=_lName;
  	counterparty.email=_email;
  	counterparty.username=_username;
  	users.push(counterparty);
  	return(true);
  }
	/**
	* use constant for getter method
	*/
  function getCounterparties() constant public returns(bytes32[], bytes32[],bytes32[],bytes32[]){
  	uint LENGTH = users.length;
  	bytes32[] memory firstNames= new bytes32[](LENGTH);
  	bytes32[] memory lastNames= new bytes32[](LENGTH);
  	bytes32[] memory usernames= new bytes32[](LENGTH);
  	bytes32[] memory emails= new bytes32[](LENGTH);

//loop over users struct array and assign them to bytes array
	    for(uint i;i<LENGTH;i++){
	    	Counterparty memory currentCounterparty;
	    	currentCounterparty=users[i];
	    	firstNames[i]=currentCounterparty.firstName;
	    	lastNames[i]=currentCounterparty.lastName;
	    	emails[i]=currentCounterparty.email;
	    	usernames[i]=currentCounterparty.username;
	     }
    return(firstNames,lastNames,emails,usernames);
  }

}
