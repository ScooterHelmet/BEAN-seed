var Regulator = artifacts.require("./Regulator.sol");
var ServiceCenter = artifacts.require("./ServiceCenter.sol");

module.exports = function(deployer) {
  deployer.deploy(Regulator);
  deployer.deploy(ServiceCenter);
};