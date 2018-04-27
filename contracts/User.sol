pragma solidity ^0.4.19;
import "./Asset.sol";

contract User {
/*TODO
1.Write a function to check user existence before user registration
2. Write events for each function so that the dapp developer can process them
3. Write documentation using napspec for solidity
4. function to check user account ehter balance
5. write unit test for each contract
6. study how to use trffle.json for you smart contract logic management
7. install ethereum-ens/ens-utils for ethereum namespace feature just like dns ip service
8. deploy your contract on https://ropsten.infura.io
9. use decyphertv npm module utils for contract dev
*/
     //buyer || seller => Counterparty
			struct UserStruct {
				address userAccount;
				bytes32 firstName;
				bytes32 lastName;
				bytes32 email;
				bytes32 username;
			}

  event UserRegisterdSuccessfully();
	/*Insert here all the events required for this contract */

  mapping (address => UserStruct) users;//not used yet

  UserStruct[] public userList;
	UserStruct public counterparty;

  function User() public {
    // constructor
  }

/**
*register user/counterparty: buyer & sellers]
*/
  function registerUser
  (bytes32 _fName,
  bytes32 _lName,
  bytes32 _email,
  bytes32 _username) public payable returns(bool success)  {
	counterparty.userAccount=msg.sender;
  	counterparty.firstName=_fName;
  	counterparty.lastName=_lName;
  	counterparty.email=_email;
  	counterparty.username=_username;
  	userList.push(counterparty);
  	success=true;
  }
	/**
	* view all users/counterparties
	*/
  function getAllUsers() constant public returns(address[], bytes32[], bytes32[],bytes32[],bytes32[]){
  	uint TOTAL_USERS = userList.length;
		// declare an array for each UserStruct attributes
		//Note: working with array of strings in solidity is not supported yet
	address[] memory userAccounts= new address[](TOTAL_USERS);
  	bytes32[] memory firstNames= new bytes32[](TOTAL_USERS);
  	bytes32[] memory lastNames= new bytes32[](TOTAL_USERS);
  	bytes32[] memory usernames= new bytes32[](TOTAL_USERS);
  	bytes32[] memory emails= new bytes32[](TOTAL_USERS);

//loop over users struct array and assign them to bytes array since solidity is not yet provide
//a feature to return struct data types
	    for(uint i;i<TOTAL_USERS;i++){
	    	UserStruct memory currentCounterparty;
	    	currentCounterparty=userList[i];
			  userAccounts[i]=currentCounterparty.userAccount;
	    	firstNames[i]=currentCounterparty.firstName;
	    	lastNames[i]=currentCounterparty.lastName;
	    	emails[i]=currentCounterparty.email;
	    	usernames[i]=currentCounterparty.username;
	     }
		//solidity doesn't support string concatination and hence u need work with bytes
		//front end/dapp developer can convert the returned bytes32 into ascii
		//using web3.js
    return(userAccounts,firstNames,lastNames,emails,usernames);
  }



  //find a user using their account/ethereum account/address


	function getUserByAccount(address _userAccount) public view
	returns(address, bytes32, bytes32,bytes32,bytes32) {
	//returns(bool) {
		bool searchResult;
		searchResult=false;
		//require(_userAccount!=address(0));//check if address is set or not empty

		bytes32 firstName;
		bytes32 lastName;
		bytes32 email;
		bytes32 username;
		address userAccount;

		for(uint i;i<userList.length;i++){
		UserStruct memory user;
			user =userList[i];
					if(user.userAccount==_userAccount){
						userAccount=user.userAccount;
						firstName=user.firstName;
						lastName=user.lastName;
						email=user.email;
						username=user.username;
						searchResult=true;
					} else{
					searchResult=false;
					//TODO: rever(), assert() and throw method cause vm exception
					//results invalid opicode: study and fix the problem
					//revert();
					}

		 }
	//return(searchResult);
	return(userAccount,firstName,lastName,email,username);
	}

	function testAddressComparison(address _userAccount) public view returns(address, address,bool){
     bool compareAddresses =this==_userAccount;
		return(this,_userAccount,compareAddresses);
		//return(this.address==_userAccount);
	}

}
