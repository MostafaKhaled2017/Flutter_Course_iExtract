import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fix_my_english/additional_files/global_methods.dart';
import 'package:fix_my_english/file.dart';
import 'package:fix_my_english/mistake_api.dart';
import 'package:fix_my_english/states/home_states.dart';
import 'package:fix_my_english/views/mistakes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// We create class extends extends Cubit<states>
class HomeCubit extends Cubit<HomeStates> {
  BuildContext context;

  //We pass the initial state to super
  HomeCubit(HomeStates? initialState, this.context) : super(HomeInitState());

  //We create Function to get object from cubit
  static HomeCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  // We create methods to modify the states

  void changeTheme(String value) {
    if (value == 'Light Theme') {
      AdaptiveTheme.of(context).setLight();
    } else if (value == 'Dark Theme') {
      AdaptiveTheme.of(context).setDark();
    }
  }

  void submitText(String text) async {
    //Checking internet connection
    bool isOnline = await hasNetwork(context);

    if (isOnline) {
      List<Future<MistakeFile>> files = [];
      files.add(mistakesFromAPI(text, 'UnNamed', context));
      redirectToMistakePage(context, files);
    } else {
      onNetworkMissed(context);
    }
  }

  void redirectToMistakePage(
      BuildContext context, List<Future<MistakeFile>> files) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MistakesPage(files: files)));
  }
}
