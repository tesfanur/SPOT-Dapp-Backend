const CarTrade = artifacts.require('./CarTrade.sol');
contract('CarTrade', function(accounts) {
  it("should assert true", function(done) {
    var car_trade = CarTrade.deployed();
    console.log(car_trade.getCarDetailInfo());
    assert.isTrue(true);
    done();
  });
});
