//pragma solidity ^0.4.24;
pragma solidity ^0.5.8;

import "./Roles.sol";

contract ArtistRole {

  using Roles for Roles.Role;

  event ArtistAdded(address indexed account);
  event ArtistRemoved(address indexed account);

  Roles.Role private artists;

  constructor() public {
    _addArtist(msg.sender);
  }

  modifier onlyArtist() {
    require(isArtist(msg.sender));
    _;
  }

  // Function 'isArtist' to check this role
  function isArtist(address account) public view returns (bool) {
    return artists.has(account);
  }

  // Function 'addArtist' that adds this role
  function addArtist(address account) public onlyArtist {
    _addArtist(account);
  }

  // Function 'renounceArtist' to renounce this role
  function renounceArtist() public {
    _removeArtist(msg.sender);
  }

  // Define an internal function '_addArtist' to add this role, called by 'addArtist'
  function _addArtist(address account) internal {
    artists.add(account);
    emit ArtistAdded(account);
  }

  // Define an internal function '_removeArtist' to remove this role, called by 'removeArtist'
  function _removeArtist(address account) internal {
    artists.remove(account);
    emit ArtistRemoved(account);
  }
}