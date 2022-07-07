// @dart=2.9
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'firebase_options.dart';
import 'views/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Localization/app_localizations.dart';
import 'Localization/app_localizations_delegate.dart';
import 'Localization/app_localizations_setup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/home_cubit.dart';

const proxy = 'https://cors-anywhere.herokuapp.com/';
const urlAPI = 'https://aqueous-anchorage-93443.herokuapp.com/FixMyEnglish';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  //Initializing Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Pass all uncaught errors from the framework to Firebase Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color.fromRGBO(122, 55, 11, 1),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey,
      ),
      initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MultiBlocProvider(
        providers: [
          BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
          ],
            child: BlocBuilder<LocaleCubit, LocaleState>(
              buildWhen: (previousState, currentState) =>
              previousState != currentState,
                builder: (_, localeState) {
                  return MaterialApp(
                    theme: theme,
                    darkTheme: darkTheme,
                    debugShowCheckedModeBanner: false,
                    home: HomePage(),
                    supportedLocales: supportedLocales,
                    localizationsDelegates: localizationsDelegates,
                    localeResolutionCallback: localeResolutionCallback,
                    locale: localeState.locale,
                  );
                },
            ),
      ),
    );
  }
}
