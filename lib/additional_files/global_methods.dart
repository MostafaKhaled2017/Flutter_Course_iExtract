import 'package:universal_io/io.dart';
import 'package:flutter/material.dart';

void onNetworkMissed(BuildContext context) {
  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      content: const Text(
          'Failed to connect to network. Please connect to the Internet then try again'),
      backgroundColor: Colors.grey,
      actions: [
        TextButton(
          child: const Text('DISMISS'),
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
        ),
      ]));
}

Future<bool> hasNetwork(BuildContext context) async {

  //TODO : Remove the condition
  if(Platform.isAndroid) {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  } else {
    return true;
  }
}

