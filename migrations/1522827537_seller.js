var Seller = artifacts.require("./Seller.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(Seller);
};
