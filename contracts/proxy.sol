// SPDX-License-Identifier : MIT

pragma solidity >=0.8.0<0.9.0;

contract Proxy{
    address public implementation;
    uint public x = 0;
   function setImplementation(address _implementation)external{
    implementation= _implementation;
   }
  
    function _delegate(address _implementation) internal{
        assembly{
            calldatacopy(0,0,calldatasize())
            
            let result := delegatecall(gas(),_implementation,0,calldatasize(),0,0)

             returndatacopy(0,0,returndatasize())
             switch result
             case 0{
                revert(0,returndatasize())
             }
             default{
                return (0,returndatasize())
             }

        }
         
    }
    //함수를 실행하면서 이더를 보낼떄
    fallback() external payable {
        _delegate(implementation);
    }
    //순수하게 이더만 받을떄
    receive() external payable {
        // custom function code
    }
}