import 'package:FixMyEnglish/Widgets/mistake_item.dart';
import 'package:FixMyEnglish/additional_files/mistakes_demo_data.dart';
import 'package:flutter/material.dart';

import '../file.dart';
import '../models/mistake.dart';

class MistakesPage extends StatefulWidget {
  final List<Future<MistakeFile>> files;

  const MistakesPage({Key? key, required this.files}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MistakesPageState();
}

class _MistakesPageState extends State<MistakesPage> {
  int _currentFile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mistakes Page'),
        backgroundColor: const Color.fromRGBO(122, 55, 11, 1),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            /*color: Color.fromRGBO(247, 250, 235, 1),*/
            width: 350,
            child: FutureBuilder(
              future: widget.files[_currentFile],
              builder: (context, snapshot) {
                  if(snapshot.data == null){
                  return Center(
                    child: CircularProgressIndicator(
                    ),
                  );
                }

                List<Mistake> data = ((snapshot.data as MistakeFile).mistakes).toList();

                if (data.isNotEmpty) {
                  //To Use Dummy Data in case there is a server error

                  return ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      Mistake currentItem = data[index];
                      return MistakeItem(currentItem.sentence,
                          currentItem.match, currentItem.description);
                    },
                    itemCount: data.length,
                  );
                } else {
                  return const Center(
                    child: Text('No Mistakes Found'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
