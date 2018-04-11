var Seller = artifacts.require("./Seller.sol");

module.exports = function(deployer) {
  deployer.deploy(Seller);
};
