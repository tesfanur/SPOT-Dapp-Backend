 pragma solidity ^0.4.19;
 import "./User.sol";
 import "./Buyer.sol";

contract HouseTrade {

  struct HouseStruct {
    //detail House specification is not included here, as it can be found from the manufacturers site
    bytes32 company;//company who constructed the house
    bytes32 houseNum;//houseNum=house number
    uint yearBuilt;//year of production//manufcatured year
    bool isUsed;//if the House is already started yo be used by the owner
    uint postedDate;//date by which the House is published for sales
    address owner;//make: country + manufacturer/brand
    bytes32 location;
    uint areaInCare;//in care
    uint price;//price of house in ether //think over it so that users can enter price in contracts_build_directory
    //or write a function that converts birr to ether currency
    bytes32 houseType;
  }
  //Database to store House detail info => map houseNo with House detail info
  mapping (bytes32 => HouseStruct) HousesDB;
  bytes32[] public HouseNos;//House identification number db

  //events
  event RetrivedAllHouseNums(bytes32[] houseNums, uint totalNumOfHouses);

  modifier onlyHouseOwner(bytes32 _houseNum) {
    require(HousesDB[_houseNum].owner == msg.sender);
    _;
  }

 function registerHouseDetailInfo(
   bytes32 _company,
   bytes32 _houseNum,
   uint _yearBuilt,
   bool _isUsed,
   bytes32 _location,
   uint _areaInCare,
   uint _price,
   bytes32 _houseType)  public payable returns(bool success) {
     HouseStruct memory newHouse;
     //HouseMakeStruct memory newHouseMake;

     newHouse.company=_company;
     newHouse.houseNum=_houseNum;
     newHouse.yearBuilt=_yearBuilt;
     newHouse.isUsed=_isUsed;
     newHouse.postedDate=now;
     newHouse.owner=msg.sender;
     newHouse.location=_location; //city subcity latitude longitude
     newHouse.areaInCare=_areaInCare;//area in care/square meter
     newHouse.price=_price;//price
     newHouse.houseType=_houseType;//residential, office
     // newHouse.Make.country=_country;
     // newHouse.Make.manufacturerWebsite=_manufacturerWebsite;
     //add new House info to HousesDB
     HousesDB[_houseNum]=newHouse;
     //track the number of Houses registerd
     HouseNos.push(_houseNum);

     return(true);

 }
 /**
 get Houses owned by seller//return may be an array. So try to modify the function below
  */
 function getHouseDetailInfoByHouseNum(bytes32 _houseNum)
 public constant returns(bytes32, bytes32, uint, bool, uint, address, bytes32, uint, uint, bytes32) {
     //declare temporary HouseStruct variable
       HouseStruct memory house;
       house = HousesDB[_houseNum];
  return(house.company, house.houseNum,
    house.yearBuilt, house.isUsed, house.postedDate,
    house.owner, house.location, house.areaInCare,
    house.price, house.houseType);
 }
 /**
 Get All Houses registed on ethereum blockchain
 */
  function getAllHousesDetailInfo() public view
  returns(bytes32[], bytes32[], bool[], uint[], address[], uint[]) {
     //declare arrays that should hold the attributes of a House
     HouseStruct memory House;
     uint TOTAL_HOUSE =HouseNos.length;

    bytes32[] memory companies= new bytes32[](TOTAL_HOUSE);
    bytes32[] memory houseNums= new bytes32[](TOTAL_HOUSE);
    bool[] memory isUseds= new 	bool[](TOTAL_HOUSE);
    uint[] memory yearsBuilt= new uint[](TOTAL_HOUSE);
    address[] memory owners= new address[](TOTAL_HOUSE);
    uint[] memory postedDates= new uint[](TOTAL_HOUSE);
    //uint[] memory prices= new uint[](TOTAL_HOUSE);


     for(uint i; i<TOTAL_HOUSE;i++){
      House=HousesDB[houseNums[i]];

      companies[i] =House.company;
      houseNums[i] = House.houseNum;
      isUseds[i] = House.isUsed;
      yearsBuilt[i] = House.yearBuilt;
      owners[i] = House.owner;
      postedDates[i] = House.postedDate;
      //prices[i] = House.price;

     }
      return(
       companies, houseNums, isUseds,
       yearsBuilt, owners, postedDates);

 }

 /**
 Get All Houses registed on ethereum blockchain
 */
  function getAllHousesNums() public
  returns(bytes32[],uint) {
     uint TOTAL_HOUSE =HouseNos.length;
     emit RetrivedAllHouseNums(HouseNos,TOTAL_HOUSE);
      return(HouseNos,TOTAL_HOUSE);

 }


 //change House price
function changeHousePrice(bytes32 _houseNum, uint _price)
onlyHouseOwner(_houseNum)
public returns(bool){
    HousesDB[_houseNum].price=_price;
    return(true);

}
//retrieve owner of a house
function ownerOf(bytes32 _houseNum) public view returns(address){
  return(HousesDB[_houseNum].owner);
}

}
