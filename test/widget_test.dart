// @dart=2.9


@TestOn('chrome')

import 'package:FixMyEnglish/views/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'title',
    (WidgetTester tester) async {
      tester.pumpWidget(HomePage());
      expect(find.text("Fix My English"), findsOneWidget);
    },
  );
}
