pragma solidity ^0.4.4;


contract FoodSafe {

  struct Location {
    string name;
    uint locationId;
    uint previousLocationId;
    uint timestamp;
    string secret;
  }

  mapping (uint => Location) Trail;
  uint8 trailCount=0;

  function addNewLocation(
     string _name,
     uint _locationId,
     string _secret) public payable {
    Location memory newLocation;
    newLocation.name=_name;
    newLocation.locationId=_locationId;

    newLocation.timestamp=now;
    newLocation.secret=_secret;
    if(trailCount!=0){
      newLocation.previousLocationId=Trail[trailCount].locationId;
    }else{
      
    }
    Trail[trailCount]=newLocation;
    trailCount++;
  }

  function getTrailCount() public view returns (uint8) {
    return(trailCount);
  }

  function getALocationFor(uint trailNo) public constant
  returns (string, uint, uint, uint, string) {
    return(
      Trail[trailNo].name,
      Trail[trailNo].locationId,
      Trail[trailNo].previousLocationId,
      Trail[trailNo].timestamp,
      Trail[trailNo].secret
      );
  }
}
