//pragma solidity ^0.4.24;
pragma solidity ^0.5.8;

import "./Roles.sol";

contract RetailerRole {
  using Roles for Roles.Role;

 event RetailerAdded(address indexed account);
  event RetailerRemoved(address indexed account);

  Roles.Role private retailers;

  constructor() public {
    _addRetailer(msg.sender);
  }

  modifier onlyRetailer() {
    require(isRetailer(msg.sender));
    _;
  }

  // Define a function 'isRetailer' to check this role
  function isRetailer(address account) public view returns (bool) {
    return retailers.has(account);
  }

  // Define a function 'addRetailer' that adds this role
  function addRetailer(address account) public onlyRetailer {
    _addRetailer(account);
  }

  // Define a function 'renounceRetailer' to renounce this role
  function renounceRetailer() public {
    _removeRetailer(msg.sender);
  }

  // Define an internal function '_addRetailer' to add this role, called by 'addRetailer'
  function _addRetailer(address account) internal {
    retailers.add(account);
    emit RetailerAdded(account);
  }

  // Define an internal function '_removeRetailer' to remove this role, called by 'removeRetailer'
  function _removeRetailer(address account) internal {
    retailers.remove(account);
    emit RetailerRemoved(account);
  }
}