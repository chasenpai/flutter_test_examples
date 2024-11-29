import 'package:flutter_test/flutter_test.dart';
import 'package:integration/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group('end-to-end', () {

    testWidgets('press FAB must be increase', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);

      final fab = find.byTooltip('Increment');
      await tester.tap(fab);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });

  });
  
}