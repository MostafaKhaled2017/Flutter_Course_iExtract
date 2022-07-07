import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'main.dart';
import 'file.dart';
import 'models/mistake.dart';
import 'additional_files/mistakes_demo_data.dart';

Future<MistakeFile> mistakesFromAPI(String text, String filename, BuildContext context) async {
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
    print('Connecting to Mock API');
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("API is not responding now. Please try again later"),
    ));
    List<Mistake> data = mistakes.toList();

    return MistakeFile(filename, data);
  }
}
