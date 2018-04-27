/*
pragma solidity ^0.4.19;
contract HouseTrade {

  function HouseTrade() public{

  }
} */


pragma solidity ^0.4.19;


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

 //get Houses owned by seller//return may be an array. So try to modify the function below
 function getHouseDetailInfo(bytes32 _houseNum) public constant returns(bytes32, bytes32, uint, bool, uint, address, bytes32, uint, uint, bytes32) {
     //declare temporary HouseStruct variable
       HouseStruct memory house;
       house = HousesDB[_houseNum];
  return(house.company, house.houseNum, house.yearBuilt, house.isUsed, house.postedDate, house.owner, house.location, house.areaInCare, house.price, house.houseType);
 }

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
       companies,
       houseNums,
       isUseds,
       yearsBuilt,
       owners,
       postedDates);


 }

  /* //The address of the House, which will sign transactions made by this contract.
address public HouseSigner;

// Value of the House, in wei
uint public HouseValue;

bytes32 public licensePlate;

// Owners of the House, they will be the ones that receive payments from the House.
// We assume each owner owns the House equally.

address[] public owners;
uint constant MAX_OWNERS = 100;

//Earning from driving will be distributed to each owner for them to withdraw
mapping (address => uint) public ownersBalance;
uint public balanceToDistribute;

uint constant INITIAL_HOUSE_SHARES = 100;
mapping (address => uint) public HouseShares;

DriverEntity currentDriverEntity;
DriveStatus currentDriveStatus;

//To keep track of who's currently using the House
//If the owners are driving it, it will be their address.
//If someone rented it, it will be the renter address, so he can be held accountable.
//In this case, we could even ask for a warranty which will be sent back if the House is ok.

address currentDriverAddress;
uint currentDriveStartTime = 0;
uint currentDriveRequiredEndTime = 0;

//Rates
uint constant RATE_DAILYRENTAL = 1 ether; //1 ETH

enum DriverEntity {
    None,
    Owner,
    Autopilot,
    Cab,
    Uber,
    DailyRental,
    Other
  }

enum DriveStatus {
    Idle,
    Driving,
    TurnedOff,
    Unavailable
  }

// Somehow, the House should be able to communicate its "internals" to the contract.
// These internals are the ones relevant to the functioning of the contract, such as it's fuel.
// We don't Housee about oil or coolant for example, at this point at least.

struct HouseInternals {
    uint fuel; //Measured in percentage
  }

HouseInternals HouseInternals;

bool HouseIsReady = false;

modifier onlyIfReady {
        require(HouseIsReady);
        _;
    }

function SmartHouse(bytes32 _licensePlate, uint _HouseValue) internal {
    require(_licensePlate.length >0 && _HouseValue > 0);
    HouseSigner = msg.sender;
    HouseValue = _HouseValue;
    licensePlate = _licensePlate;[address(this)] = INITIAL_HOUSE_SHARES;

    currentDriveStatus = DriveStatus.Idle;
    currentDriverEntity = DriverEntity.None;

    HouseInternals.fuel = 100;
  } */

}
