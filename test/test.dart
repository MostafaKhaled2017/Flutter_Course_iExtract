// @dart=2.9
import 'package:fix_my_english/file.dart';
import 'package:fix_my_english/mistake_api.dart';
import 'package:fix_my_english/models/mistake.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {});
  group('API testing', () {
    test(
      'unit tests',
      () {
        expect(
            mistakesFromAPI('aaa', 'a.pdf', null),
            Future.value(MistakeFile(
              'a.pdf',
              [],
            )));

        expect(
            mistakesFromAPI("isn't", 'a.pdf', null),
            Future.value(MistakeFile(
              'a.pdf',
              [
                Mistake(
                    match: "n't",
                    sentence: "isn't",
                    label: "SPOKN1",
                    description: "Using contractions")
              ],
            )));

        expect(
            mistakesFromAPI("isn't", 'a.pdf', null),
            Future.value(MistakeFile(
              'a.pdf',
              [
                Mistake(
                    match: "n't",
                    sentence: "isn't",
                    label: "SPOKN1",
                    description: "Using contractions")
              ],
            )));

        expect(
            mistakesFromAPI("There are good", 'a.pdf', null),
            Future.value(MistakeFile(
              'a.pdf',
              [
                Mistake(
                    match: "There are",
                    sentence: "There are good",
                    label: "SPOKN1",
                    description: "Using forms of there is/are"),
                Mistake(
                    match: "good",
                    sentence: "There are good",
                    label: "VOCAB5",
                    description: "using a forbidden words"),
              ],
            )));
      },
    );
  });
}
