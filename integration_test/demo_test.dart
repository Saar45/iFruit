import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ifruit/main.dart' as app;

Future<void> pause(WidgetTester tester, int ms) async {
  final end = DateTime.now().add(Duration(milliseconds: ms));
  while (DateTime.now().isBefore(end)) {
    await tester.pump(const Duration(milliseconds: 50));
  }
}

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

  testWidgets('demo flow', (tester) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    await app.main();
    await tester.pumpAndSettle();
    await pause(tester, 2000);

    for (var i = 0; i < 3; i++) {
      await tester.fling(find.byType(PageView), const Offset(-350, 0), 1200);
      await tester.pumpAndSettle();
      await pause(tester, 1500);
    }

    await tester.tap(find.text('Start'));
    await tester.pumpAndSettle();
    await pause(tester, 2000);

    await tester.fling(find.byType(ListView), const Offset(0, -700), 1500);
    await tester.pumpAndSettle();
    await pause(tester, 1000);
    await tester.fling(find.byType(ListView), const Offset(0, 700), 1500);
    await tester.pumpAndSettle();
    await pause(tester, 1000);

    await tester.tap(find.text('Strawberry'));
    await tester.pumpAndSettle();
    await pause(tester, 2000);

    await tester.fling(find.byType(CustomScrollView), const Offset(0, -600), 1200);
    await tester.pumpAndSettle();
    await pause(tester, 1200);
    await tester.fling(find.byType(CustomScrollView), const Offset(0, -600), 1200);
    await tester.pumpAndSettle();
    await pause(tester, 1500);

    await tester.pageBack();
    await tester.pumpAndSettle();
    await pause(tester, 1000);

    await tester.scrollUntilVisible(
      find.text('Watermelon'),
      150,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    await pause(tester, 800);
    await tester.tap(find.text('Watermelon'));
    await tester.pumpAndSettle();
    await pause(tester, 2000);
    await tester.pageBack();
    await tester.pumpAndSettle();
    await pause(tester, 1000);

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    await pause(tester, 2000);

    await tester.tap(find.byType(SwitchListTile));
    await tester.pumpAndSettle();
    await pause(tester, 2000);
  });
}
