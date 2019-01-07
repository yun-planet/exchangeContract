pragma solidity ^0.4.19;

import "./oraclizeAPI.sol";
import "./YUNTToken.sol";

contract YUNDexContract  {

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Receive(address from, uint256 value, address token, bytes extraData);
    event mylog(uint code);
    YUNTCoinToken yuntToken;
    function() public{
        
    }
    
    function config(YUNTCoinToken _yuntToken) public{
        yuntToken = _yuntToken;
    }
    
    function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public{
        Receive(_from,_value,_token,_extraData);
    }

    function  sendToken (address _from,address _to,uint256 _value) internal{
        if(yuntToken.transferFrom(_from,_to,_value)){
            mylog (0);
        }else{
            mylog (500);
        }
    }  
    
    function exChangeYUNT(address _from,address _to,uint256 _value) public{
       sendToken(_from,_to,_value);
    }
     
}