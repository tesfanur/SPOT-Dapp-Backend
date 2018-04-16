pragma solidity ^0.4.2;

import './zeppelin/lifecycle/Killable.sol';

contract Authentication is Killable {
  struct User {
    bytes32 name;
  }
//buyer || seller => Counterparty
struct UserStruct {
 address userAccount;
 bytes32 firstName;
 bytes32 middleName;
 bytes32 lastName;
 bytes32 email;
 bytes32 username;
}


  mapping (address => User) public users;
  mapping (address => UserStruct) public UsersDB;
  uint public totalNumberOfUsers;
  address[] public userEthAccounts;

  uint private id; // Stores user id temporarily

  modifier onlyExistingUser {
    // Check if user exists or terminate
    require(!(users[msg.sender].name == 0x0));
    _;
  }

  modifier onlyValidName(bytes32 name) {
    // Only valid names allowed

    require(!(name == 0x0));
    _;
  }

  function login() constant
  public
  onlyExistingUser
  returns (bytes32) {
    return (users[msg.sender].name);
  }
  /**
  *Get user by the address who called the function
  *Here is the syntax to call this function
  *Authentication.at(Authentication.address).getUser({from:web3.eth.accounts[1]})
  */
  function getUser() constant
  public
  returns (address, bytes32,bytes32,bytes32,bytes32,bytes32) {
    return (UsersDB[msg.sender].userAccount,
            UsersDB[msg.sender].firstName,
            UsersDB[msg.sender].middleName,
            UsersDB[msg.sender].lastName,
            UsersDB[msg.sender].email,
            UsersDB[msg.sender].username);
  }

  function signup(bytes32 name)
  public
  payable
  onlyValidName(name)
  returns (bytes32) {
    // Check if user exists.
    // If yes, return user name.
    // If no, check if name was sent.
    // If yes, create and return user.

    if (users[msg.sender].name == 0x0)
    {
        users[msg.sender].name = name;

        return (users[msg.sender].name);
    }

    return (users[msg.sender].name);
  }

  UserStruct[] public userList;
  UserStruct public counterparty;

  /**
  *register user/counterparty: buyer & sellers]
  */
    function registerUser
    (bytes32 _fName,
    bytes32 _lName,
    bytes32 _middleName,
    bytes32 _email,
    bytes32 _username) public payable returns(bool success)  {
  	counterparty.userAccount=msg.sender;
    totalNumberOfUsers++;
    	counterparty.firstName=_fName;
    	counterparty.lastName=_lName;
    	counterparty.middleName=_middleName;
      counterparty.email=_email;
    	counterparty.username=_username;

      //save user struct object inot UsersDB
      UsersDB[msg.sender] = counterparty;

      //add user ethereum account address into userEthAccounts array
      userEthAccounts.push(msg.sender);

    	userList.push(counterparty);
    	success=true;
    }
  	/**
  	* view all users/counterparties
  	*/
    function getAllUsers() constant public returns(address[], bytes32[],bytes32[], bytes32[],bytes32[],bytes32[]){
    	uint TOTAL_USERS = userList.length;
  		// declare an array for each UserStruct attributes
  	  address[] memory userAccounts= new address[](TOTAL_USERS);
    	bytes32[] memory firstNames= new bytes32[](TOTAL_USERS);
    	bytes32[] memory middleNames= new bytes32[](TOTAL_USERS);
    	bytes32[] memory lastNames= new bytes32[](TOTAL_USERS);
      bytes32[] memory emails= new bytes32[](TOTAL_USERS);
    	bytes32[] memory usernames= new bytes32[](TOTAL_USERS);

  //loop over users struct array and assign them to bytes array since solidity is not yet provide
  //a feature to return struct data types
  	    for(uint i;i<TOTAL_USERS;i++){
  	    	UserStruct memory currentCounterparty;
  	    	currentCounterparty=userList[i];
  			  userAccounts[i]=currentCounterparty.userAccount;
  	    	firstNames[i]=currentCounterparty.firstName;
  	    	lastNames[i]=currentCounterparty.lastName;
  	    	middleNames[i]=currentCounterparty.middleName;
          emails[i]=currentCounterparty.email;
  	    	usernames[i]=currentCounterparty.username;
  	     }
  		//solidity doesn't support string concatination and hence u need work with bytes
  		//front end/dapp developer can convert the returned bytes32 into ascii
  		//using web3.js
      return(userAccounts,firstNames,middleNames,lastNames,emails,usernames);
    }


    /**
    * view users/counterparties
    */
    function getUsers() constant public
    returns(address[], bytes32[], bytes32[],bytes32[],bytes32[],bytes32[]){
      //uint TOTAL_USERS = userList.length;
      uint TOTAL_USERS = userEthAccounts.length;
      // declare an array for each UserStruct attributes
      address[] memory userAccounts= new address[](TOTAL_USERS);
      bytes32[] memory firstNames= new bytes32[](TOTAL_USERS);
      bytes32[] memory middleNames= new bytes32[](TOTAL_USERS);
      bytes32[] memory lastNames= new bytes32[](TOTAL_USERS);
      bytes32[] memory emails= new bytes32[](TOTAL_USERS);
      bytes32[] memory usernames= new bytes32[](TOTAL_USERS);

    //loop over users struct array and assign them to bytes array since solidity is not yet provide
    //a feature to return struct data types
        for(uint i;i<TOTAL_USERS;i++){
          UserStruct memory currentCounterparty;

          currentCounterparty=userList[i];
          //or
          currentCounterparty=UsersDB[userEthAccounts[i]];

          userAccounts[i]=currentCounterparty.userAccount;
          firstNames[i]=currentCounterparty.firstName;
          lastNames[i]=currentCounterparty.lastName;
          middleNames[i]=currentCounterparty.middleName;
          emails[i]=currentCounterparty.email;
          usernames[i]=currentCounterparty.username;
         }
      //solidity doesn't support string concatination and hence u need work with bytes
      //front end/dapp developer can convert the returned bytes32 into ascii
      //using web3.js
      return(userAccounts,firstNames,middleNames,lastNames,emails,usernames);
    }
 /**
 *
 */
  function update(bytes32 name)
  public
  payable
  onlyValidName(name)
  onlyExistingUser
  returns (bytes32) {
    // Update user name.

    if (users[msg.sender].name != 0x0)
    {
        users[msg.sender].name = name;

        return (users[msg.sender].name);
    }
  }
}
