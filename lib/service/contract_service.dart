import 'dart:async';
import 'package:web3dart/web3dart.dart';

typedef TransferEvent = void Function(
  EthereumAddress from,
  EthereumAddress to,
  BigInt value,
);

abstract class IContractService {
  Future<Credentials> getCredentials(String privateKey);
  Future<String?> sendEcoin(
      String privateKey, EthereumAddress receiver, BigInt amount,
      {TransferEvent? onTransfer, Function(Object exeception)? onError});
  Future<BigInt> getTokenBalanceEcoin(EthereumAddress from);
  Future<EtherAmount> getEthBalance(EthereumAddress from);
  Future<void> dispose();
  StreamSubscription listenTransferEcoin(TransferEvent onTransfer);
}

class ContractService implements IContractService {
  ContractService(this.client, this.contractEcoin, this.contractWBNB);

  final Web3Client client;
  final DeployedContract contractEcoin;
  final DeployedContract contractWBNB;

  ContractEvent _transferEventEcoin() => contractEcoin.event('Transfer');
  ContractFunction _balanceFunctionEcoin() => contractEcoin.function('balanceOf');
  ContractFunction _sendFunctionEcoin() => contractEcoin.function('transfer');

  ContractEvent _transferEventWBNB() => contractWBNB.event('Transfer');
  ContractFunction _balanceFunctionWBNB() => contractWBNB.function('balanceOf');
  ContractFunction _sendFunctionWBNB() => contractWBNB.function('transfer');

  @override
  Future<Credentials> getCredentials(String privateKey) =>
      client.credentialsFromPrivateKey(privateKey);

  @override
  Future<EtherAmount> getEthBalance(EthereumAddress from) async {
    return client.getBalance(from);
  }

  @override
  Future<String?> sendEcoin(
      String privateKey, EthereumAddress receiver, BigInt amount,
      {TransferEvent? onTransfer, Function(Object exeception)? onError}) async {
    final credentials = await getCredentials(privateKey);
    final from = await credentials.extractAddress();
    final networkId = await client.getNetworkId();

    StreamSubscription? event;
    // Workaround once sendTransacton doesn't return a Promise containing confirmation / receipt
    if (onTransfer != null) {
      event = listenTransferEcoin((from, to, value) async {
        onTransfer(from, to, value);
        await event?.cancel();
      }, take: 1);
    }

    try {
      final transactionId = await client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contractEcoin,
          function: _sendFunctionEcoin(),
          parameters: [receiver, amount],
          from: from,
        ),
        chainId: networkId,
      );
      print('transact started $transactionId');
      return transactionId;
    } catch (ex) {
      if (onError != null) {
        onError(ex);
      }
      return null;
    }
  }

  @override
  Future<BigInt> getTokenBalanceEcoin(EthereumAddress from) async {
    final response = await client.call(
      contract: contractEcoin,
      function: _balanceFunctionEcoin(),
      params: [from],
    );

    return response.first as BigInt;
  }

  @override
  StreamSubscription listenTransferEcoin(TransferEvent onTransfer, {int? take}) {
    var events = client.events(FilterOptions.events(
      contract: contractEcoin,
      event: _transferEventEcoin(),
    ));

    if (take != null) {
      events = events.take(take);
    }

    return events.listen((event) {
      if (event.topics == null || event.data == null) {
        return;
      }

      final decoded =
          _transferEventEcoin().decodeResults(event.topics!, event.data!);

      final from = decoded[0] as EthereumAddress;
      final to = decoded[1] as EthereumAddress;
      final value = decoded[2] as BigInt;

      print('$from}');
      print('$to}');
      print('$value}');

      onTransfer(from, to, value);
    });
  }

  @override
  Future<String?> sendWBNB(
      String privateKey, EthereumAddress receiver, BigInt amount,
      {TransferEvent? onTransfer, Function(Object exeception)? onError}) async {
    final credentials = await getCredentials(privateKey);
    final from = await credentials.extractAddress();
    final networkId = await client.getNetworkId();

    StreamSubscription? event;
    // Workaround once sendTransacton doesn't return a Promise containing confirmation / receipt
    if (onTransfer != null) {
      event = listenTransferWBNB((from, to, value) async {
        onTransfer(from, to, value);
        await event?.cancel();
      }, take: 1);
    }

    try {
      final transactionId = await client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: contractWBNB,
          function: _sendFunctionWBNB(),
          parameters: [receiver, amount],
          from: from,
        ),
        chainId: networkId,
      );
      print('transact started $transactionId');
      return transactionId;
    } catch (ex) {
      if (onError != null) {
        onError(ex);
      }
      return null;
    }
  }

  @override
  Future<BigInt> getTokenBalanceWBNB(EthereumAddress from) async {
    final response = await client.call(
      contract: contractWBNB,
      function: _balanceFunctionWBNB(),
      params: [from],
    );

    return response.first as BigInt;
  }

  @override
  StreamSubscription listenTransferWBNB(TransferEvent onTransfer, {int? take}) {
    var events = client.events(FilterOptions.events(
      contract: contractWBNB,
      event: _transferEventWBNB(),
    ));

    if (take != null) {
      events = events.take(take);
    }

    return events.listen((event) {
      if (event.topics == null || event.data == null) {
        return;
      }

      final decoded =
      _transferEventWBNB().decodeResults(event.topics!, event.data!);

      final from = decoded[0] as EthereumAddress;
      final to = decoded[1] as EthereumAddress;
      final value = decoded[2] as BigInt;

      print('$from}');
      print('$to}');
      print('$value}');

      onTransfer(from, to, value);
    });
  }

  @override
  Future<void> dispose() async {
    await client.dispose();
  }
}
