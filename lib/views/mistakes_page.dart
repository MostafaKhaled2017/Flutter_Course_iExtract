import 'package:FixMyEnglish/cubit/mistakes_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FixMyEnglish/Localization/app_localizations.dart';
import '../file.dart';
import '../states/mistakes_page_states.dart';

class MistakesPage extends StatefulWidget {
  final List<Future<MistakeFile>> files;

  const MistakesPage({Key? key, required this.files}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MistakesPageState();
}

class _MistakesPageState extends State<MistakesPage> {
  final int _currentFile = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:  (BuildContext context) => MistakesPageCubit(),
        child: BlocConsumer<MistakesPageCubit, MistakesPageStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, state) {
            MistakesPageCubit cubit = MistakesPageCubit.get(context);

            return  Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.translate('MistakesPage'),),
                backgroundColor: const Color.fromRGBO(122, 55, 11, 1),
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    /*color: Color.fromRGBO(247, 250, 235, 1),*/
                    width: 350,
                    child: FutureBuilder(
                      future: widget.files[_currentFile],
                      builder: (context, snapshot) {
                        return cubit.loadData(context, snapshot);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
    );

  }
}
