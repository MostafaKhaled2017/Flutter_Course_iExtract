import 'package:fix_my_english/Localization/app_localizations.dart';
import 'package:fix_my_english/additional_files/app_constants.dart';
import 'package:fix_my_english/additional_files/global_variables.dart';
import 'package:fix_my_english/cubit/home_cubit.dart';
import 'package:fix_my_english/cubit/local/locale_cubit.dart';
import 'package:fix_my_english/home_header.dart';
import 'package:fix_my_english/states/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final controller = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(null, context),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            HomeCubit cubit = HomeCubit(null, context);

            return SafeArea(
              maintainBottomViewPadding: true,
              bottom: true,
              // resizeToAvoidBottomInset: false,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('iExtract'),
                  backgroundColor: const Color.fromRGBO(122, 55, 11, 1),
                  actions: <Widget>[
                    DropdownButton<String>(
                      value: currentLanguage,
                      elevation: 16,
                      onChanged: (String? newValue) {
                        if (currentLanguage != newValue!) {
                          currentLanguage = newValue;
                          if (currentLanguage == 'English') {
                            BlocProvider.of<LocaleCubit>(context).toEnglish();
                          } else {
                            BlocProvider.of<LocaleCubit>(context).toArabic();
                          }
                        }
                      },
                      items: <String>['English', 'عربي']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            // style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: PopupMenuButton<String>(
                        onSelected: (String choice) =>
                            cubit.changeTheme(choice),
                        itemBuilder: (BuildContext context) {
                          return choices.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),
                    ),
                  ],
                ),
                resizeToAvoidBottomInset: false,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HomeHeader(),
                    SafeArea(
                      maintainBottomViewPadding: true,
                      bottom: true,
                      child: SizedBox(
                        width: 720,
                        height: 275,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 25.0, 10, 0),
                          child: TextField(
                            controller: controller,
                            minLines: 10,
                            maxLines: 20,
                            decoration: InputDecoration(
                              labelText: AppLocalizations.of(context)!
                                  .translate('textFieldHint'),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 2.0),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ElevatedButton(
                            onPressed: () => cubit.submitText(controller.text),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromRGBO(242, 238, 225, 1)),
                            ),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .translate('ElevatedButton'),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color.fromRGBO(73, 69, 7, 1),
                                  fontFamily: 'Merriweather',
                                  fontSize: 24,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.5),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
