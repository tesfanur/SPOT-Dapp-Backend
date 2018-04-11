var Buyer = artifacts.require("./Buyer.sol");

module.exports = function(deployer) {
  deployer.deploy(Buyer);
};
