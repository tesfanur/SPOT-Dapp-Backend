const Buyer = artifacts.require('./Buyer.sol');
contract('Buyer', function(accounts) {
  it("should assert true", function(done) {
    var buyer = Buyer.deployed();
    assert.isTrue(true);
    done();
  });
});
