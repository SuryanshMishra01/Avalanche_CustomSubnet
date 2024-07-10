# Avalanche_CustomSubnet
This project is a basic version of deFi gaming ecosystem that is made to get deployed on my own (custom) EVM subnet on Avalanche blockchain.
## Creating EVM Subnet on Avalanche with Ava Labs
I have created my own EVM Subnet (custom) on Avalanche network using the Avalanche CLI and following the steps given below:
1) To start first install the Avalanche CLI tool and setup the necessary environment. It is supported in MacOS and Linux only but we can also use WSL2 in Windows.
2) run the command in the Ubuntu terminal: avalanche subnet create DragonNest
3) Choose the chainID & token symbol. In my case --> (chainID: 7788 & Token Symbol: DRAX)
4) run the command: avalanche deploy DragonNest
5) After deploying, add the network to your wallet (Metamask) through RPC URL & chainID.
6) Import the account using private key in the Metamask.
7) Now, we can interact with the game deployed in our own subnet using Remix IDE and Metamask wallet.

# Description
This project consists 2 solidity smart contract files:
### 1) ERC20 Token:
It is my own version of ERC20 token --> 'myERC20_token.sol' , extended from standard ERC20 interface on github --> 
https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol
This token acts as the currency for my gaming ecosystem. Players can bet or stake these coins and win rewards or more coins.
In future development, these coins will also be used to redeem the in-game NFTs and many more.
In my version: the token name is 'Elixir Coin' & symbol is 'EC'.
The functions: mint_Elixir() --> used to mint elixir tokens and can only be called by owner.
transfer_ElxirFrom() --> used to transfer tokens between any 2 player's accounts.
burn_Elixir() --> used to burn tokens and remove them from overall network.

### 2) Vault: 
This smart contract --> 'myElixir_Vault.sol' will act as the liquidity pool, it means every token, gaming asset or wei / ether will be stored exchanged from here through the contract.
The functions: generateRandomNumber() --> used to generate random no. using metadata of current block.
guess_theCup() --> It is the logic behind our game 'Guess The Cup' where a ball is kept inside any one of the three cups and player has to guess the cup.
playGuessTheCupGame() --> this function will be called by players to play the game by staking their coins and passing the guessed cup no. as argument in the function.
If they win coins will be doubled & returned.
If they loose the staked coins will be lost.
checkBalance() --> to check the current token balance of the player.
# Getting Started 
## Executing Program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/. Once you are on the Remix website, create 2 new files by clicking on the "+" icon in the left-hand sidebar. Save the "ERC20_token" & "Vault" contracts in my repo as your own with a .sol extension.
•	Now, compile & deploy the ERC20 contract and copy its address
•	Then, compile the Vault contract and pass the copied address as a constructor argument.
•	Deploy the Vault contract. All Done !!
## Interacting with Program

# Author 
Suryansh Mishra @suryanshmishra0704@gmail.com
# License
This project is licensed under the Apache License 2.0 - see the LICENSE.md file for details.






