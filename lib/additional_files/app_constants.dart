import 'package:fix_my_english/Localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const Iterable<Locale> supportedLocales = [
  Locale('en'),
  Locale('ar'),
];

const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];
String currentLanguage = 'English';
