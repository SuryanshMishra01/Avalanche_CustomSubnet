// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";


contract myERC20_token is ERC20 ("Elixir Coin", "EC"){
    address public  owner;

    constructor(){
        owner = msg.sender;
    }
    
    modifier onlyOwner{
        require(msg.sender == owner,"Only Owner can mint Tokens");
        _mint(address(this), 100);
        _;
    }

    function mint_Elixir(uint _value) public onlyOwner{
            _mint(msg.sender, _value);           
    }
    
 
    //function to transfer token between any 2 accounts
    function transfer_ElixirFrom(address from, address to, uint _value) public{
       require(balanceOf(from) >= _value,"Balance is not sufficient"); //check enough tokens to transfer
       _approve(from, to, _value);
       transferFrom(from, to, _value);
    }


    function burn_Elixir(uint _value) public{
        require(balanceOf(msg.sender) >= _value,"Balance is not sufficient"); //check enough tokens to burn
        _burn(msg.sender, _value);
    }   
}