const ServiceList = artifacts.require("ServiceList");

module.exports = function(deployer) {
  deployer.deploy(ServiceList);
};