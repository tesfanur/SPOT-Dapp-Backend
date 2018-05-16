const Buyer = artifacts.require('./Buyer.sol');
//const User = artifacts.require('./User.sol');
contract('Buyer', function(accounts) {
  it("\nBuyer should access Buyer contract", function(done) {
     Buyer.deployed().then(function(buyer) {
        var acct = web3.eth.accounts;
        return buyer.getBalanceOfBuyer(acct[0])
      }).then(function(balanceOfBuyer) {
        console.log("balanceOfBuyer:",balanceOfBuyer +"\n");
      });
        done();
      });
});
