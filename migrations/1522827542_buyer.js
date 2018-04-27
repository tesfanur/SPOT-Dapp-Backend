var Buyer = artifacts.require("./Buyer.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(Buyer);
};
