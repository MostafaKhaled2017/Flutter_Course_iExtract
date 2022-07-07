import 'package:flutter/material.dart';

import 'TextHighlight.dart';

class MistakeItem extends StatelessWidget {
  final String sentence;
  final String match;
  final String description;

  const MistakeItem(this.sentence, this.match, this.description);

  @override
  Widget build(BuildContext context) {
    //Converting match from string to List<String> to work with the widget
    List<String> matches = <String>[];
    matches.add(match);
    return InkWell(
      onTap: null,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            buildDTH(sentence, matches, description),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text('Error: ${description}',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
