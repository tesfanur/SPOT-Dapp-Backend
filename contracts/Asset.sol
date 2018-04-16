pragma solidity ^0.4.19;

//import "github.com/Arachnid/solidity-stringutils/strings.sol";

contract Asset {
   // using strings for *;
  address public assetAddress;
  string public name;
  string public description;

	struct AssetStruct {
		bytes32 id;//serialNumber or any other identification number
		bytes32 name;
		bytes32 assetType;
		bytes32 manufacturer;
		bytes32 description;
		uint price;
		address owner;
		//uint timestamp;
	}

	mapping (address => AssetStruct) AssetDB;
	//array of Asset struct
	AssetStruct[] public Assets;

  function Asset() public{
  	// constructor
  	assetAddress=msg.sender;
  }

  event SuccessfullyRegisted(
    bytes32 id,
    bytes32 name,
    bytes32 assetType,
    bytes32 manufacturer,
    bytes32 description,
    uint price);

	/**
	 Function to register a new asset
	 */
	function registerAsset(
		bytes32 _id,
		bytes32 _name,
		bytes32 _assetType,
		bytes32 _manufacturer,//brand/company
		bytes32 _description,
		uint _price) public returns (bool){

			AssetStruct memory newAsset;
			newAsset.id = _id;
			newAsset.name = _name;
			newAsset.assetType = _assetType;
			newAsset.manufacturer = _manufacturer;
			newAsset.description = _description;
			newAsset.price = _price;
			newAsset.owner = msg.sender;
			//newAsset.timestamp = now;

			Assets.push(newAsset);
//SuccessfullyRegisted(_id,_name,_assetType,_manufacturer,_description,_price);
			return(true);
	}


  /* AssetStruct public currentAsset; */
  /*Retrieve all registed assets*/
	function getAllAssets() public payable
	returns(bytes32[],bytes32[],bytes32[],bytes32[],address[],uint[]){
			uint TOTAL_ASSETS = Assets.length;
			bytes32[] memory ids = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory names = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory manufacturers = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory descriptions = new bytes32[](TOTAL_ASSETS);
			address[] memory owners = new address[](TOTAL_ASSETS);
			uint[] memory prices = new uint[](TOTAL_ASSETS);
			//uint[] memory timestamps = new uint[](TOTAL_ASSETS);

			for (uint i = 0; i< TOTAL_ASSETS; i++){
        AssetStruct memory currentAsset;
					currentAsset = Assets[i];

					ids[i] = currentAsset.id;
					names[i] = currentAsset.name;
					manufacturers[i] = currentAsset.manufacturer;
					descriptions[i] = currentAsset.description;
					owners[i] = currentAsset.owner;
					prices[i] = currentAsset.price;
					//timestamps[i] = currentAsset.timestamp;
			}
			//return (ids,names,manufacturers,descriptions,owners,prices,timestamps);
      return (ids,names,manufacturers,descriptions,owners,prices);
	}
  /**
  *TODO: complete the following getAssetsByType function features
  */

	/* function getAssetsByType(bytes32 _assetType) constant
	returns(bytes32[],bytes32[],bytes32[],bytes32[],bytes32[]){
			uint TOTAL_ASSETS = assetDetailsByAssetType[_assetType].AID.TOTAL_ASSETS;
			bytes32[] memory ids = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory names = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory manufacturers = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory descriptions = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory owners = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory prices = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory timestamps = new bytes32[](TOTAL_ASSETS);

			assetIDs = assetDetailsByAssetType[_assetType].AID;
			for (i = 0; i< TOTAL_ASSETS; i++){
					bytes32 _assetID = assetIDs[i];
					assetNames[i] = assetDetailsByAID[_assetID].assetName;
					assetSubTypes[i] = assetDetailsByAID[_assetID].assetSubType;
					cmpnyNames[i] = assetDetailsByAID[_assetID].cmpnyName;
					descriptions[i] = assetDetailsByAID[_assetID].description;
			}
			return (assetIDs,assetNames,assetSubTypes,cmpnyNames,descriptions);
	} */

  /*Filter registed assets by asset type*/
	/* function getAssetsByType(bytes32 asset_type) public view
	returns(bytes32[],bytes32[],bytes32[],bytes32[],address[],uint[],uint[]){
			uint TOTAL_ASSETS = Assets.length;
			bytes32[] memory ids = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory names = new bytes32[](TOTAL_ASSETS);
      bytes32[] memory assetTypes = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory manufacturers = new bytes32[](TOTAL_ASSETS);
			bytes32[] memory descriptions = new bytes32[](TOTAL_ASSETS);
			address[] memory owners = new address[](TOTAL_ASSETS);
			uint[] memory prices = new uint[](TOTAL_ASSETS);
			uint[] memory timestamps = new uint[](TOTAL_ASSETS);

			for (uint i = 0; i< TOTAL_ASSETS; i++){
					currentAsset = Assets[i];

					ids[i] = currentAsset.id;
					names[i] = currentAsset.name;
          assetTypes[i] = currentAsset.assetType;
					manufacturers[i] = currentAsset.manufacturer;
					descriptions[i] = currentAsset.description;
					owners[i] = currentAsset.owner;
					prices[i] = currentAsset.price;
					timestamps[i] = currentAsset.timestamp;

          if (asset_type== assetTypes[i] ){
            return (ids,names,manufacturers,descriptions,owners,prices, timestamps);
        }
			}

	}*/



}
