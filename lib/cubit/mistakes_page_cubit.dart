import 'package:fix_my_english/Widgets/mistake_item.dart';
import 'package:fix_my_english/file.dart';
import 'package:fix_my_english/models/mistake.dart';
import 'package:fix_my_english/states/mistakes_page_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// We create class extends extends Cubit<states>
class MistakesPageCubit extends Cubit<MistakesPageStates> {
  //We pass the initial state to super
  MistakesPageCubit({MistakesPageStates? initialState})
      : super(MistakesPageInitialState());

  //We create Function to get object from cubit
  static MistakesPageCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }

  //We create methods foe changing the states

  Widget loadData(context, snapshot) {
    if (snapshot.data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    List<Mistake> data = ((snapshot.data as MistakeFile).mistakes).toList();

    if (data.isNotEmpty) {
      //To Use Dummy Data in case there is a server error

      return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, int index) {
          Mistake currentItem = data[index];
          return MistakeItem(
              currentItem.sentence, currentItem.match, currentItem.description);
        },
        itemCount: data.length,
      );
    } else {
      return const Center(
        child: Text('No Mistakes Found'),
      );
    }
  }
}
