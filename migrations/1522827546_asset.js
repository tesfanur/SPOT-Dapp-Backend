var Asset = artifacts.require("./Asset.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(Asset);
};
