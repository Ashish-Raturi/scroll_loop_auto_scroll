import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

void main() {
  testWidgets(
      'ScrollLoopAutoScroll disposes correctly without errors when animation is delayed',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      final originalOnError = FlutterError.onError;

      bool hadError = false;
      FlutterError.onError = (FlutterErrorDetails details) {
        hadError = true;
        originalOnError?.call(details);
      };

      await tester.pumpWidget(const MaterialApp(
        home: ScrollLoopAutoScroll(
          child: Text('Any text to be scrolled'),
          scrollDirection: Axis.vertical,
          delay: Duration(milliseconds: 100),
        ),
      ));

      await tester.pumpAndSettle();

      // Immediately dispose it
      await tester.pumpWidget(Container());

      await Future.delayed(const Duration(milliseconds: 101));

      FlutterError.onError = originalOnError;

      // Expect no errors
      expect(hadError, isFalse);
    });
  });
}
