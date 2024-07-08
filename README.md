# Avalanche_CustomSubnet
This project is a basic version of deFi gaming ecosystem that is made to get deployed on my own (custom) EVM subnet on Avalanche.
## Creating EVM Subnet on Avalanche with Ava Labs
I have created my own EVM Subnet (custom) on Avalanche network using the Avalanche CLI and following the steps given below:
1) To start first install the Avalanche CLI tool and setup the necessary environment. It is supported in MacOS and Linux only but we can also use WSL2 in Windows.
2) run the command in the Ubuntu terminal: avalanche subnet create DragonNest
3) Choose the chainID & token symbol. In my case --> (chainID: 7788 & Token Symbol: DRAX)
4) run the command: avalanche deploy DragonNest
5) After deploying, add the network to your wallet (Metamask) through RPC URL & chainID.
6) Import the account using private key in the Metamask.
7) Now, we can interact with the game deployed in our own subnet using Remix IDE and Metamask wallet.
