import 'package:flutter/material.dart';

Locale? localeResolutionCallback(
    Locale? locale, Iterable<Locale>? supportedLocales) {
  for (final Locale supportedLocale in supportedLocales!) {
    if (supportedLocale.languageCode == locale!.languageCode) {
      return supportedLocale;
    }
  }
  return supportedLocales.first;
}