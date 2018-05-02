 const User = artifacts.require('./User.sol');
contract('User', function(accounts) {
  it("should assert true", function(done) {
    var User = User.deployed();
    assert.isTrue(true);
    done();
  });
});
