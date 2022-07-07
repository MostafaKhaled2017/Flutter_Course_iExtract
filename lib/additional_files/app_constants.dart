import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../Localization/app_localizations.dart';

const Iterable<Locale> supportedLocales = [
  Locale('en'),
  Locale('ar'),
];

const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
];