// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";


contract ProxyContractV1 is Initializable,UUPSUpgradeable,OwnableUpgradeable{
    uint public count;

    //맨 처음 실행
  function initialize() public initializer {
count= 10;
__Ownable_init();
    
  }
   function _authorizeUpgrade(address)
    internal
    override
    onlyOwner
  {}

  function inc()external{
    count++;
  }
}

contract ProxyContractV2 is ProxyContractV1{
    function dec()external{
        count--;
    }
}