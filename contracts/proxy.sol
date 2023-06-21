// SPDX-License-Identifier : MIT

pragma solidity >=0.8.0<0.9.0;

contract Proxy{
    address public implementation;
    
   function setImplementation(address _implementation)external{
    implementation= _implementation;
   }
  
    function _delegate(address _implementation) internal{
        assembly{
            calldatacopy(0,0,calldatasize())


            
        }
         
    }
}