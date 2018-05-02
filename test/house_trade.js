const HouseTrade = artifacts.require('./HouseTrade.sol');
contract('HouseTrade', function(accounts) {
  it("should assert true", function(done) {
    var house_trade = HouseTrade.deployed();
    assert.isTrue(true);
    done();
  });
});
