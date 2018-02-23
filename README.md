# BEAN-seed
BEAN - Blockchain, Express, Angular, and Node.js 

An blockchain javascript stack for developing decentralized applications
## Prerequisites

Node 8.9.4 or higher </br>

## Table of Contents

* [Installation](#installation)
* [Remixd IDE](#remixd-ide)
* [Unit Testing Framework](#unit-testing-framework)
* [DApp Testing](#dapp-testing)
* [Ethereum DApp Analytics](#ethereum-dapp-analytics)
* [Useful Links](#useful-links)

## Installation

**INSTALLS:** </br>
Angular-cli
```bash
npm install -g @angular/cli
```
Solidity Compiler </br>
```bash
npm install -g solc
```
Ganache-cli (recommended GUI http://truffleframework.com/ganache/)
```bash
npm install -g ganache-cli
```
Truffle
```bash
npm install -g truffle
```
Clone Project and Install dependencies
```bash
git clone https://github.com/ScooterHelmet/BEAN-seed.git
npm install
```
You are all set! </br>

**Run the Local Blockchain (CLI)** </br>
```bash
ganache-cli --accounts 5 --blocktime 10 --port 7545 --gasPrice 20000000 --gasLimit 60000 --debug
```
**Compile the DApp contracts in new command shell window or tab** </br>
```bash
truffle compile
```
**Deploy the DApp contracts in the command shell window or tab**</br>
```bash
truffle migrate
```
**Start the DApp** </br>
```bash
truffle serve -p 8081
```
Navigate to http://localhost:8081 </br>
**Start Angular2 app** </br>
```bash
ng serve
```
Navigate to http://localhost:4200 </br>

## Ethereum Smart Contract Editor, Compiler, and Deployment
RemixIDE on localhost - https://github.com/ethereum/browser-solidity </br>
Remix server on localhost - https://github.com/ethereum/remixd
```bash
npm install -g remixd
```
## Ethereum DApp RPC Clients and Tools for DApp Unit Testing and Regression Testing
Web3js - Ethereum Javascript API </br>
https://github.com/ethereum/web3.js/
```bash
npm install -g web3
```
Ganache-cli - (recommended GUI http://truffleframework.com/ganache/)
```bash
npm install -g ganache-cli
```
</br>
Metamask - Ethereum dApps right in your browser without running a full Ethereum node </br>
https://github.com/MetaMask </br>
See installation at https://metamask.io/ </br>
</br>
Solidity-repl - Unit Testing HTTP JSON RPC </br>
https://github.com/raineorshine/solidity-repl </br>
See more installation at https://www.npmjs.com/package/solidity-repl </br>
</br>
Dapp Tools - Build, test, deploy and transact with Ethereum contracts from the CLI </br>
https://github.com/dapphub/dapp </br>
See here https://dapp.tools/ 

## Ethereum DApp Analytics
Etherscan - The Ethereum BlockChain Explorer, API and Analytics Platform. </br>
Debugging here https://etherscan.io/ </br>
</br>
Solgraph - Smart contract security analytics </br>
https://github.com/raineorshine/solgraph </br>
```bash
npm install -g solgraph
```

## Ethereum DApp Scaling
μRaiden (micro raiden) - A payment channel framework for fast & free off-chain ERC20 token transfers.
https://github.com/raiden-network/microraiden
See here: https://www.npmjs.com/package/@raiden_network/microraiden
See here: https://raiden.network/micro.html

## Ethereum DApp File Storage
Interplanetory File System (IPFS) - Install here: https://ipfs.io/docs/install/
```bash
tar xvfz go-ipfs.tar.gz
mv go-ipfs/ipfs /usr/local/bin/ipfs
ipfs init
```

## Useful Links
DApp Hub - Blockchain DApp governance with DSAuth, DSMath, DS token box, & more. </br>
See here https://dapphub.com/ 

Ethereum DApp name registration </br>
See here https://www.myetherwallet.com/#domainsale

Mist Browser - Browse and use Ðapps on the Ethereum network. </br>
https://github.com/ethereum/mist/releases


