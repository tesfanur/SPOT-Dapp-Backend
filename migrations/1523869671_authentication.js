var Authentication = artifacts.require("./Authentication.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(Authentication);
};
