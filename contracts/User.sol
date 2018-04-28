pragma solidity ^0.4.2;

import './zeppelin/lifecycle/Killable.sol';

/// @title User User Contract for counterparties[buyers and sellers]
/// @author Tesfaye Belachew Abebe <get.tesfaye.belachew@gmail.com>
/// @notice You can use this contract for user registeration, login, update user Data and view user info
/// @dev All function calls are currently implement without side effects

contract User is Killable {

//buyer || seller => Counterparty
struct UserStruct {
 address userAccount;
 bytes32 firstName;
 bytes32 middleName;
 bytes32 lastName;
 bytes32 email;
 bytes32 username;
}
  //variables to hold user database
  mapping (address => UserStruct) public UsersDB;
  uint public totalNumberOfUsers;
  address[] public userEthAccounts;
  //events
  event UserSuccessfullyRegisterd(
  address _userAccount,
   bytes32 _firstName,
   bytes32 _middleName,
   bytes32 _lastName,
   bytes32 _email,
   bytes32 _username);
   event RetrievedUsersInfoSuccesfully(
     address[] userAccounts,
     bytes32[] firstNames,
     bytes32[] middleNames,
     bytes32[] lastNames,
     bytes32[] emails,
     bytes32[] usernames);

 /**
 *validate registed users
 */
  modifier onlyRegisterdUser {
    // Check if user exists or terminate
    require(!(UsersDB[msg.sender].userAccount == 0x0));
    _;
  }

  /**
  *validate if user account doesn't exist
  **/
  modifier onlyNoUserAccount() {
    // Only users with valid ethereum account is allowed
    require(UsersDB[msg.sender].userAccount == 0x0);
    _;
  }



  UserStruct[] public userList;
  UserStruct public counterparty;

  /**
  *register user/counterparty: buyer & sellers]
  */
/// @author Tesfaye Belachew Abebe <get.tesfaye.belachew@gmail.com>
/// @notice Allows user to get registed
/// @dev    Here user refers to a buyer or seller of an asset
/// @param _firstName The first name of a user (English)
/// @param _middleName The middle name of a user (English)
/// @param _lastName The last name of a user (English)
/// @param _email The first email address of a user (English)
/// @param _username The first username of a user (English)
/// @return true if user registeration is suscceful
    function registerUser
    (bytes32 _firstName,
    bytes32 _lastName,
    bytes32 _middleName,
    bytes32 _email,
    bytes32 _username) public payable
    onlyNoUserAccount
    returns(bool success)  {
  	counterparty.userAccount=msg.sender;
    totalNumberOfUsers++;
    	counterparty.firstName=_firstName;
    	counterparty.lastName=_lastName;
    	counterparty.middleName=_middleName;
      counterparty.email=_email;
    	counterparty.username=_username;

      //save user struct object inot UsersDB
      UsersDB[msg.sender] = counterparty;

      //add user ethereum account address into userEthAccounts array
      userEthAccounts.push(msg.sender);

    	userList.push(counterparty);

      emit UserSuccessfullyRegisterd(
         msg.sender, _firstName, _middleName,
         _lastName, _email, _username);
    	success=true;
    }


      /**
      *modified user login
      * to login from ethereum client use:
      * User.at(User.address).login({from: web3.eth.accounts[2]})
      */
      /// @author Tesfaye Belachew Abebe <get.tesfaye.belachew@gmail.com>
      /// @notice Allows user to login using their ethereum account
      /// @dev    Here user refers to a buyer or seller of an asset
      /// @return  user account and username if user login is suscceful
      function login(address _userAccountAddress) constant
      public
      onlyRegisterdUser
      returns (address, bytes32) {
        return (UsersDB[_userAccountAddress].userAccount,UsersDB[_userAccountAddress].username);
      }
      /**
      *Get user by the address who called the function
      *Here is the syntax to call this function
      *User.at(User.address).getUser({from:web3.eth.accounts[1]})
      */
      function getUser()
      constant public
      returns (address, bytes32,bytes32,bytes32,bytes32,bytes32) {
        UserStruct memory user;

        /* return (UsersDB[msg.sender].userAccount,
                UsersDB[msg.sender].firstName,
                UsersDB[msg.sender].middleName,
                UsersDB[msg.sender].lastName,
                UsersDB[msg.sender].email,
                UsersDB[msg.sender].username); */
            user = UsersDB[msg.sender];
            return (user.userAccount,
                    user.firstName,
                    user.middleName,
                    user.lastName,
                    user.email,
                    user.username);
      }
  	/**
  	* view all users/counterparties
  	*/
    /// @author Tesfaye Belachew Abebe <get.tesfaye.belachew@gmail.com>
    /// @notice Allows users to view all acounterparties info
    /// @dev    Here user refers to a buyer or seller of an asset
    /// @return array of user attributes if query made is suscceful
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
    /// @author Tesfaye Belachew Abebe <get.tesfaye.belachew@gmail.com>
    /// @notice Allows user view counterparties detail information
    /// @dev    Here user refers to either a buyer or seller of an asset
    /// @return users detail info if requested query is suscceful
    function getUsers() payable public
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
    emit  RetrievedUsersInfoSuccesfully(
        userAccounts,
        firstNames,
        middleNames,
        lastNames,
        emails,
        usernames);
      return(userAccounts,firstNames,middleNames,lastNames,emails,usernames);
    }
 /**
 *
 */
 /// @author Tesfaye Belachew Abebe <get.tesfaye.belachew@gmail.com>
 /// @notice Allows user to update their profile info
 /// @dev    Here user refers to a buyer or seller of an asset
 /// @param _firstName The first name of a user (English)
 /// @param _middleName The middle name of a user (English)
 /// @param _lastName The last name of a user (English)
 /// @param _email The first email address of a user (English)
 /// @param _username The first username of a user (English)
 /// @return updated user infor if user update query is suscceful

  function updateUserData(
    bytes32 _firstName,
    bytes32 _middleName,
    bytes32 _lastName,
    bytes32 _email,
    bytes32 _username)
  public
  payable
  onlyOwner
  onlyRegisterdUser
  returns (address, bytes32,bytes32,bytes32,bytes32,bytes32) {
            if(_firstName!=0x0)
            UsersDB[msg.sender].firstName=_firstName;
            if(_middleName!=0x0)
            UsersDB[msg.sender].middleName=_middleName;
            if(_lastName!=0x0)
            UsersDB[msg.sender].lastName=_lastName;
            if(_email!=0x0)
            UsersDB[msg.sender].email=_email;
            if(_username!=0x0)
            UsersDB[msg.sender].username=_username;


    return (UsersDB[msg.sender].userAccount,
            UsersDB[msg.sender].firstName,
            UsersDB[msg.sender].middleName,
            UsersDB[msg.sender].lastName,
            UsersDB[msg.sender].email,
            UsersDB[msg.sender].username);
  }

}
