var Migrations = artifacts.require("./Migrations.sol");

module.exports = function(deployer,_network, _accounts) {
  deployer.deploy(Migrations);
};
