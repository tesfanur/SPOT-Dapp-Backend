const CarTrade = artifacts.require('./CarTrade.sol');
contract('CarTrade', function(accounts) {
  it("should assert true", function(done) {
    // var car_trade = CarTrade.deployed();
    // console.log(car_trade.getCarDetailInfo("1M2GDM9AXKP052787"));
    // assert.isTrue(true);
    console.log(accounts)
    done();
  });
  // it("Should return Car detail info", function() {
  //    var instance;
  //    return CarTrade.at(CarTrade.address).then(function(_instance) {
  //       instance = _instance;
  //       return instance.getCarDetailInfo.call("1M2GDM9AXKP052787");
  //    }).then(function(_carInfo) {
  //      console.log('_carInfo: ' + _carInfo);
  //       // console.log('VIN: ' + _carInfo[0]);
  //       // console.log('Car make: ' + _carInfo[1]);
  //       // console.log('Car model: ' + _carInfo[2]);
  //       // assert.equal(_carInfo[0], "12345678901234567", "Car VIN is wrong");
  //       // assert.equal(_carInfo[1], "Mitsubishi", "Car make is wrong");
  //       // assert.equal(_carInfo[2], "Galant ES, 2009", "Car model is wrong");
  //    });
  // });
});
