const AddressBook = artifacts.require("AddressBook");

module.exports = async function (deployer) {
  await deployer.deploy(AddressBook);
  const addressBook = await AddressBook.deployed();
};
