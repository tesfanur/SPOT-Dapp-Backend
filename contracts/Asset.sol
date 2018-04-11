pragma solidity ^0.4.19;

//import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract Asset {
   // using strings for *;
	address public assetAddress;
  string public name;
  string public description;

	struct AssetStruct {
		string name;
		string description;
	}

	mapping (address => AssetStruct) AssetDB;

  function Asset() public{
  	// constructor
  	assetAddress=msg.sender;
  }

  function tellMeYourself() public pure returns(string){
      return("I am Asset Smart Contract!");
  }

  function setAssetName(string _name) public payable {
      name=_name;
  }

  function getAssetName() public view returns(string)  {
     return(name);
  }

  function setAssetInfo(string _name, string _description) public payable {
    name =_name;
    description =_description;
  }

  function assetInfo() public returns(string , address){
  	return(name,assetAddress);
  }

}
