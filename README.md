# BEAN-seed
BEAN - Blockchain, Express, Angular, and Node.js 

An blockchain javascript stack for developing decentralized applications
## Prerequisites

Node 8.9.4 or higher </br>

## Table of Contents

* [Installation](#installation)
* [Ethereum Smart Contract Editor, Compiler, and Deployment](#ethereum-smart-contract-editor-compiler-and-deployment)
* [Ethereum DApp RPC Clients and Tools for DApp Unit Testing and Regression Testing](#ethereum-dapp-rpc-clients-and-tools-for-dapp-unit-testing-and-regression-testing)
* [Ethereum DApp Analytics](#ethereum-dapp-analytics)
* [Ethereum DApp Scaling](#ethereum-dapp-scaling)
* [Ethereum DApp File Storage](#ethereum-dapp-file-storage)
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
See Github project here: https://github.com/ethereum/web3.js/</br>
See Node package here: https://www.npmjs.com/package/web3</br>
```bash
npm install -g web3
```

Ganache-cli - Fast Ethereum RPC client for testing and development</br>
Installation here: http://truffleframework.com/ganache/</br>
```bash
npm install -g ganache-cli
```

Truffle - DApp development framework</br>
See Github project here: https://github.com/trufflesuite/truffle</br>
See website here: http://truffleframework.com/</br>
```bash
npm install -g truffle
```

</br>
Metamask - Ethereum dApps right in your browser without running a full Ethereum node</br>
https://github.com/MetaMask</br>
See installation: https://metamask.io/</br>
</br>

Dapp Tools - Build, test, deploy and transact with Ethereum contracts from the CLI</br>
See Github project here: https://github.com/dapphub/dapp</br>
See website here: https://dapp.tools/</br>
</br>

DApp Hub - Blockchain DApp governance with DSAuth, DSMath, DS token box, & more.</br>
See website here: https://dapphub.com/</br>

## Ethereum DApp Analytics
Etherscan - The Ethereum BlockChain Explorer, API and Analytics Platform.</br>
See website here: https://etherscan.io/</br>
</br>

## Ethereum DApp Scaling
μRaiden (micro raiden) - A payment channel framework for fast & free off-chain ERC20 token transfers.</br>
See Github project here: https://github.com/raiden-network/microraiden</br>
See Node package here: https://www.npmjs.com/package/@raiden_network/microraiden</br>
See website here: https://raiden.network/micro.html</br>

## Ethereum DApp File Storage
Interplanetory File System (IPFS) - A P2P hypermedia protocol.</br>
Installation here: https://ipfs.io/docs/install/</br>
```bash
tar xvfz go-ipfs.tar.gz
mv go-ipfs/ipfs /usr/local/bin/ipfs
ipfs init
```

## Useful Links


Ethereum DApp name registration </br>
See here https://www.myetherwallet.com/#domainsale

Mist Browser - Browse and use Ðapps on the Ethereum network. </br>
See Github project here: https://github.com/ethereum/mist/releases


