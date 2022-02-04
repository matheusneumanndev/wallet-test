import 'package:etherwallet/converter.dart';
import 'package:etherwallet/model/network_type.dart';
import 'package:etherwallet/utils/wallet_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({
    Key? key,
    required this.address,
    required this.network,
    required this.onReset,
    required this.onRevealKey,
  }) : super(key: key);

  final String? address;
  final NetworkType network;
  final GestureTapCallback? onReset;
  final GestureTapCallback? onRevealKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('Converter'),
            subtitle: const Text('Corretora descentralizada'),
            trailing: const Icon(WalletIcons.coins, color: Color(0xff1a0441)),
            onTap: () async {
              Get.to(ConverterPage());
            },
          ),
          ListTile(
              title: const Text('Chave privada'),
              subtitle: const Text('Revelar sua chave privada'),
              trailing: const Icon(
                WalletIcons.key,
                color: Color(0xff1a0441),
              ),
              onTap: onRevealKey),
          ListTile(
              title: const Text('Resetar carteira'),
              subtitle: const Text('Apagar todos os dados'),
              trailing: const Icon(
                WalletIcons.skull,
                color: Color(0xff1a0441),
              ),
              onTap: onReset),
        ],
      ),
    );
  }
}
