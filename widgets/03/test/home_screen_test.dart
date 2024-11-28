import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:three/main.dart';

void main() {

  testWidgets('input text and drag', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField), 'hello');

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump(); //setState

    expect(find.text('hello'), findsOneWidget);

    await tester.drag(find.byType(Dismissible), const Offset(500, 0));
    await tester.pumpAndSettle(); //setState until the dismiss animation is complete

    expect(find.text('hello'), findsNothing);
  });

}