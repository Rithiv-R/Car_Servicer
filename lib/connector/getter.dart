import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:flutter/widgets.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ServiceListModel extends ChangeNotifier {
  List<Serv> sdone = [];
  bool isLoading = true;
  final String _rpcUrl = "HTTP://192.168.43.3:7545";
  final String _wsUrl = "ws://192.168.43.3:7545";
  final String _privatekey =
      'ec22fdcec0bb2943d3ad6c84543a5095d993799725c8af21a4beb83e81438a7d';

  late String uemail;
  late Web3Client _client;
  var _abicode;
  int taskCount = 0;
  late Credentials _credentials;
  late EthereumAddress _contractAddress;
  late EthereumAddress _ownAddressl;
  late DeployedContract _contract;
  late ContractFunction _taskCount;
  late ContractFunction _sdones;
  late ContractFunction _createService;
  late ContractEvent _taskCreatedEvent;

  ServiceListModel(email) {
    this.uemail = email;
    initialeSetup();
  }

  Future<void> initialeSetup() async {
    _client = Web3Client(
      _rpcUrl,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("src/abis/ServiceList.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abicode = jsonEncode(jsonAbi['abi']);
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]['address']);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privatekey);
    _ownAddressl = await _credentials.extractAddress();
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abicode, "ServiceList"), _contractAddress);
    _taskCount = _contract.function('servicecount');
    _createService = _contract.function('createService');
    _sdones = _contract.function("serv1");
    _taskCreatedEvent = _contract.event("ServiceCreated");
    getTods(uemail);
  }

  getTods(String email) async {
    var totaTasksListc = await _client
        .call(contract: _contract, function: _taskCount, params: []);
    BigInt totalCount = totaTasksListc[0];
    taskCount = totalCount.toInt();
    for (var i = 0; i < totalCount.toInt(); i++) {
      var temp = await _client.call(
          contract: _contract, function: _sdones, params: [BigInt.from(i)]);
      print(temp);
      if (email == temp[0]) {
        sdone.add(Serv(
            customeremail: temp[0], carreg: temp[1], servicehash: temp[2]));
      }
    }
    isLoading = false;
    notifyListeners();
  }

  addTask(String cemail, String creg, String servicehash) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _createService,
            parameters: [cemail, creg, servicehash]));
    getTods(this.uemail);
  }
}

class Serv {
  String customeremail;
  String carreg;
  String servicehash;
  Serv(
      {required this.customeremail,
      required this.carreg,
      required this.servicehash});
}
