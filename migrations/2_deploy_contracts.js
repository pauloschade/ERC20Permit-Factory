const PermitFactory = artifacts.require("PermitFactory");

module.exports = function (deployer) {
  deployer.deploy(PermitFactory);
};
