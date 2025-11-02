// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:personal_portfolio/main.dart';
import 'dart:ui' as ui;

void main() {
  testWidgets('App builds and shows name in app bar at top', (tester) async {
    // Ensure a wide layout so the app bar Row doesn't overflow in test
    final dpi = tester.view.devicePixelRatio;
    tester.view.physicalSize = ui.Size(1400 * dpi, 900 * dpi);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());
    // Allow initial frames
    await tester.pumpAndSettle(const Duration(milliseconds: 100));

    // Verify the app bar title is present when at the top
    expect(find.text('Saleh Ghulam'), findsOneWidget);
  });
}
