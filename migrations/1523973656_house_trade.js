var HouseTrade = artifacts.require("./HouseTrade.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(HouseTrade);
};
