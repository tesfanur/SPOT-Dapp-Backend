pragma solidity ^0.4.19;


contract CarTrade {

  /**
  *Car Make struct definition/object
  */
  struct CarMakeStruct {
    //detail car specification is not included here, as it can be found from the manufacturers site
    bytes32 brand;//make: brand name of car manufacturer
    bytes32 country;//make: country where the car is manufactured
    bytes32 manufacturerWebsite;
  }
  /**
  *Car struct definition/object
  */
  struct CarStruct {
    //detail car specification is not included here, as it can be found from the manufacturers site
    bytes32 model;//model: attribute given by the manufacturer
    bytes32 vin;//vin: 17 character length vehicle identification number e.g 1M8GDM9AXKP042788
    uint year;//year of production//manufcatured year
    bool isUsed;//if the car is already started yo be used by the owner
    uint postedDate;//date by which the car is published for sales
    address owner;//make: country + manufacturer/brand
    CarMakeStruct Make;//car make
    //uint price;
  }


  //Database to store car detail info => map vins with car detail info
  mapping (bytes32 => CarStruct) CarsDB;
  bytes32[] public Vins;//car identification number db

  /**
  *register Car for sales
  */
 function registerCarDetailInfo(
   bytes32 _model,
   bytes32 _vin,
   uint _year,
   bool _isUsed,
   bytes32 _brand,
   bytes32 _country,
   bytes32 _manufacturerWebsite)  public payable returns(bool success) {
     CarStruct memory newCar;
     //CarMakeStruct memory newCarMake;

     newCar.model=_model;
     newCar.vin=_vin;
     newCar.isUsed=_isUsed;
     newCar.year=_year;
     newCar.owner=msg.sender;
     newCar.postedDate=now;

     newCar.Make.brand=_brand;
     newCar.Make.country=_country;
     newCar.Make.manufacturerWebsite=_manufacturerWebsite;
     //add new car info to CarsDB
     CarsDB[_vin]=newCar;
     //track the number of cars registerd
     Vins.push(_vin);

     return(true);

 }
 /**
 *get cars owned by seller//return may be an array. So try to modify the function below
 */
 function getCarDetailInfo() public pure returns(
     bytes32, bytes32, bool, uint, address,
     uint, bytes32,  bytes32, bytes32) {
     //declare temporary CarStruct variable
     CarStruct memory car;

      return(
       car.model, car.vin, car.isUsed, car.year,
       car.owner, car.postedDate,
       car.Make.brand, car.Make.country,
       car.Make.manufacturerWebsite
       );
 }

  function getAllCarsDetailInfo() public view
  returns(bytes32[], bytes32[], bool[], uint[], address[], uint[]) {
       /* ,
       uint[],
       bytes32[],
       bytes32[],
       bytes32[] */
     //declare arrays that should hold the attributes of a car
     CarStruct memory car;
     uint TOTAL_CARS =Vins.length;

    bytes32[] memory models= new bytes32[](TOTAL_CARS);
    bytes32[] memory vins= new bytes32[](TOTAL_CARS);
    bool[] memory isUseds= new 	bool[](TOTAL_CARS);
    uint[] memory manufactureYears= new uint[](TOTAL_CARS);
    address[] memory owners= new address[](TOTAL_CARS);

    uint[] memory postedDates= new uint[](TOTAL_CARS);
    /*bytes32[] memory brands= new bytes32[](TOTAL_CARS);
    bytes32[] memory countries= new bytes32[](TOTAL_CARS);
    bytes32[] memory manufacturerWebsites= new bytes32[](TOTAL_CARS);*/


     for(uint i; i<TOTAL_CARS;i++){
      car=CarsDB[Vins[i]];

       models[i] =car.model;
       vins[i] = car.vin;
       isUseds[i] = car.isUsed;
       manufactureYears[i] = car.year;
       owners[i] = car.owner;

        postedDates[i] = car.postedDate;
       /*brands[i] = car.Make.brand;
       countries[i] = car.Make.country;
       manufacturerWebsites[i] = car.Make.manufacturerWebsite;*/
     }
      return(
       models,
       vins,
       isUseds,
       manufactureYears,
       owners,
       postedDates );  /* ,
       manufacturerWebsites,
       brands,
       countries,
       manufacturerWebsites */


 }
}
