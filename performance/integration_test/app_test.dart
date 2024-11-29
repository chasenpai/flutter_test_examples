import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:performance/main.dart';

void main() {

  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end', () {

    testWidgets('scroll performance test', (tester) async {
      await tester.pumpWidget(const MyApp());

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('item_50_text'));

      //record performance
      await binding.traceAction(() async {
          await tester.scrollUntilVisible(
            itemFinder,
            100,
            scrollable: listFinder,
          );
        },
        reportKey: 'scrolling_timeline',
      );

      expect(itemFinder, findsOneWidget);
    });

  });

}