import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';

Future<bool> hasNetwork(BuildContext context) async {
  //TODO : Make sure it works on Web
  try {
    final result = await InternetAddress.lookup('example.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}

void onNetworkMissed(BuildContext context) {
  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      content: Text(
          'Failed to connect to network. Please connect to the Internet then try again'),
      backgroundColor: Colors.grey,
      actions: [
        TextButton(
          child: Text('DISMISS'),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
        ),
      ]));
}
