## Ethereum wallet using an [ERC-20](https://en.wikipedia.org/wiki/ERC-20) smart contract.

A digital wallet app, developed in dart language and flutter framework. The idea is to help developers to understand how to build dApps using blockchain and associated technologies. This app can transfer tokens from one wallet to another, through an [ERC-20](https://en.wikipedia.org/wiki/ERC-20) Ethereum contract.

### What's being used

- Built in [Flutter](https://flutter.dev/docs/get-started/install) framework
- [QR code scanner](https://github.com/juliuscanute/qr_code_scanner) to scan addresses
- [Web3Dart](https://github.com/simolus3/web3dart) to interact with Ethereum blockchain
- [Flutter hooks](https://github.com/rrousselGit/flutter_hooks) to manage widget life-cycle.
- [Solidity](https://github.com/allanclempe/ether-wallet-contract) smart contract

|                              Wallet                              |                              Change network                              |                                Transfer tokens                                |
| :--------------------------------------------------------------: | :-------------------------------------------------------------------: | :----------------------------------------------------------------------: |
| ![Your wallet](https://faucet.clempe.dev/images/your-wallet-2.jpg) | ![Change network](https://faucet.clempe.dev/images/change-network-2.jpg) | ![Transfer tokens](https://faucet.clempe.dev/images/transfer-address-2.jpg) |

### Getting started

How to watch/build autogenerated files

```bash
$ flutter packages pub run build_runner build   # to build
$ flutter packages pub run build_runner watch   # to watch
```

How to run the app

```bash
$ flutter pub get packages
$ flutter packages pub run build_runner build
$ flutter run
```

running on the browser

```bash
$ flutter run -d chrome
```

How to run tests

```bash
$ flutter test
```

### Wallet balance

For those who don't want to play with smart contracts yet, you can claim some test coins (tokens) and ether using the following links or check out [this repo](https://github.com/allanclempe/ether-wallet-contract) to understand how to deploy your own contract.

**_Transfer test TOKENS to your wallet:_**

After setting up your wallet, you will need some tokens to play with. Use the link below to transfer some tokens to your wallet.

[https://faucet.clempe.dev](https://faucet.clempe.dev)

**_Transfer test Ether to your wallet_**

To process transactions on the network, you will also need ETH to pay transaction fees, called gas. You also can claim some to test your wallet. Each network has its own faucet.

- Ropsten: [https://faucet.ropsten.be/](https://faucet.ropsten.be/)
- Polygon (old MATIC): [https://faucet.polygon.technology/](https://faucet.polygon.technology/)
- BSC: [https://testnet.binance.org/faucet-smart](https://testnet.binance.org/faucet-smart)

just be patient, the transaction might take a while to be processed.

### The smart contract

Feel free to check out the smart contract used in this project [https://github.com/allanclempe/ether-wallet-contract](https://github.com/allanclempe/ether-wallet-contract)


### Buy me a coffee

If you enjoy my work, a small donation would be greatly appreciated.

|                                    BTC                                     |                                     ETH                                      |
| :------------------------------------------------------------------------: | :--------------------------------------------------------------------------: |
| <img src="https://faucet.clempe.dev/images/btc-address.png" width="150" /> | <img src="https://faucet.clempe.dev/images/eth-address.png"  width="150"  /> |

### License

Copyright © 2019-present Allan Clempe. This source code is licensed under the MIT license found in the [LICENSE.txt](https://github.com/allanclempe/ether-wallet-flutter/blob/master/LICENSE.txt) file.

---

dart wallet cryto flutter eth smart contracts - by [Allan Clempe](https://twitter.com/aclempe)