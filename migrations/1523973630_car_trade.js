var CarTrade = artifacts.require("./CarTrade.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(CarTrade);
};
