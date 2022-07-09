import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Localization/app_localizations.dart';
import 'additional_files/mistakes_demo_data.dart';
import 'file.dart';
import 'main.dart';
import 'models/mistake.dart';

Future<MistakeFile> mistakesFromAPI(
    String text, String filename, BuildContext context) async {
  final labels = jsonDecode(
      jsonEncode(AppLocalizations.of(context)!.translate('ApiNotWorking')));
  final response = await http.post(
    Uri.parse(urlAPI),
    headers: {
      "accept": "application/json",
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*"
    },
    body: jsonEncode({
      "text": text,
    }),
  );
  if (response.statusCode == 200) {
    return MistakeFile(
      filename,
      List<Mistake>.from(
          json.decode(response.body).map((x) => Mistake.fromJson(x))),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(labels),
    ));
    List<Mistake> data = mistakes.toList();

    return MistakeFile(filename, data);
  }
}
