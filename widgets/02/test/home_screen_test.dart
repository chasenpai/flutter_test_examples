import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll/main.dart';

void main() {

  testWidgets('find an item in a list', (tester) async {
    await tester.pumpWidget(const MyApp(),);

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    await tester.scrollUntilVisible(
      itemFinder,
      100,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });

}