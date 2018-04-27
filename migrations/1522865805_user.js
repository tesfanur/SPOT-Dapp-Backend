var User = artifacts.require("./User.sol");
module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(User);
};
