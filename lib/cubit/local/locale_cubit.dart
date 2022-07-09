import 'package:bloc/bloc.dart';
import 'package:fix_my_english/additional_files/app_constants.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:meta/meta.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super(currentLanguage == 'English'
            ? const SelectedLocale(Locale('en'))
            : const SelectedLocale(Locale('ar')));

  // void toRussian() => emit(const SelectedLocale(Locale('ru')));
  void toArabic() => emit(const SelectedLocale(Locale('ar')));
  void toEnglish() => emit(const SelectedLocale(Locale('en')));
}
