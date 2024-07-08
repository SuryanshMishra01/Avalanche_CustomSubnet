// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/Strings.sol";
import "./myERC20_token.sol";


contract myElixir_Vault {
    myERC20_token public immutable token;
  
    constructor(address _token) {
        token = myERC20_token(_token);
    }

       
    //function to generate random numbers
    function generateRandomNumber() internal view returns(uint){
    uint value =  uint256(keccak256(abi.encodePacked(block.timestamp,block.coinbase)));
    return value;
    }
    
    //===== function to play the game - Guess The Cup ======
    //there are three cups \_/ \_/ \_/ and a ball o which is inside any one of these cups.
    // You have to guess which cup --> 1, 2 or 3. If your guess is right, you WIN !! 

    function guess_theCup(uint _input)internal view returns(bool,uint){
        require(_input < 4 && _input > 0," Input must be either 1, 2 or 3");
        uint cupNumber = generateRandomNumber()%4;
        if(_input == cupNumber){
            return (true,cupNumber); 
        }
        else {
            return (false,cupNumber);
        }
        
    }

    //If you loose your staked coins will be lost.
    //If you WIN your staked coins will be doubled and returned.

    function playGuessTheCupGame(uint cupNumber, uint stakeValue)public payable returns(string memory) {
        token.transfer_ElixirFrom(msg.sender, address(this), stakeValue);  //the tokens are now staked to contract's address
         (bool res, uint num) = guess_theCup(cupNumber);
        
        if(res){
            token.transfer(msg.sender, stakeValue * 2); //the tokens are doubled and returned.
             return  string.concat("You WON !! The right cup is : ", Strings.toString(num));
             
        }
        //the tokens are lost to the contract.
        return string.concat("You LOOSE !! The right cup is : ", Strings.toString(num));
       
    }
    function checkBalance()public view returns(uint){
        return token.balanceOf(msg.sender);
    }

}
