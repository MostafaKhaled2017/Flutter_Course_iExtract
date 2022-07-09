// @dart=2.9

//@TestOn('chrome')

import 'package:fix_my_english/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Homepage widget testing", () {
    testWidgets(
      'title',
      (WidgetTester tester) async {
        tester.pumpWidget(MediaQuery(data: null, child: HomePage()));
        expectSync(find.text("Fix My English"), findsOneWidget);
      },
    );
    testWidgets(
      'ElevatedButton',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          MediaQuery(data: null, child: HomePage()),
        );
        await tester.enterText(find.byType(TextField), 'Hello');
        await tester.press(find.byType(ElevatedButton));
        await tester.pumpAndSettle();
        expect(find.text("No Mistakes Found"), findsOneWidget);
      },
    );
  });
}
