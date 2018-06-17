const Buyer = artifacts.require('./Buyer.sol');
//const User = artifacts.require('./User.sol');
var acct = web3.eth.accounts;
var fromAscii =web3._extend.utils.fromAscii;
var toAscii =web3._extend.utils.toAscii;
var fromweiToEther=web3._extend.utils.fromWei;

contract('Buyer', function(accounts) {
  it("Buyer should access Buyer contract", function(done) {
     Buyer.deployed().then(function(buyer) {
        var acct = web3.eth.accounts;
        return buyer.getBalanceOfBuyer(acct[0])
      }).then(function(balanceOfBuyer) {
        console.log("balanceOfBuyer:",balanceOfBuyer +"\n");
      });
        done();
      });
});
