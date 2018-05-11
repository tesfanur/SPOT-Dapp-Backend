
# SMART CONTRACT ETHEREUM BLOCKCHAIN DAPP REPOSITORY FOR SMART PROPERTY OWNERSHIP TRANSFER(SPOT)

###### Distributed Application(dapp) for property(particularly car and house) ownership transfer build
  - on top of ethereum blockchain
  - using solidity contract oriented programming language
  - truffle solidity + Javascript framework for smart contract dapp development

## dApp(decentralized Application)

###### dapp structure
- contracts : contains smart contracts written in solidity
- migration : contains smart contract migration code, useful for deployment of smart contracr to network.
- test : contains test cases which can be written in Solidity or Javascript.  

Please follow below steps to download and install tools required to setup up Ethereum solidity based dApp on your machine.

## Prerequisite
- windows or linux os
- nodejs/nmp to install module dependencies and use it as a development environment
- truffle framework with ganache testrpc
- Metamask google chrome plugin

## How to run
 - git clone `http://git.gebeya.com/SPOT-Project-Team/SPOT-Dapp-Backend.git`
 - Then go to `cd SPOT-Dapp-Backend/` folder and use the following
 - run npm install for module dependencies
 - open cmd window or terminal window if you are on linux and use the following truffle cli commands sequentially
 - truffle develop
 - compile
 - migrate

## To test the contract use sample inputs from `SPOT-Dapp-Backend/temp.js` file
   - Note: most of the return values from smart contract functions are hex valued strings.To view their corresponding Ascii values you need to use web3 utils module.
