import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one/home_screen.dart';

void main() {

  testWidgets('title and message display well', (tester) async {
    await tester.pumpWidget( //runApp
      const MaterialApp(
        home: HomeScreen(
          title: 'test',
          message: 'success',
        ),
      ),
    );

    final titleFinder = find.text('test'); //CommonFinder
    final messageFinder = find.text('success');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
  
  testWidgets('find by key', (tester) async {
    const testKey = Key('key');

    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(
          key: testKey,
          title: 'test',
          message: 'success',
        ),
      ),
    );
    
    expect(find.byKey(testKey), findsOneWidget);
  });

}