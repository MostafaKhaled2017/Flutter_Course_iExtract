// @dart=2.9
import 'package:flutter/material.dart';

import 'home_page.dart';

const proxy = 'https://cors-anywhere.herokuapp.com/';
const urlAPI = 'https://aqueous-anchorage-93443.herokuapp.com/FixMyEnglish';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iExtract',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(122, 55, 11, 1),
      ),
      home: HomePage(),
    );
  }
}
