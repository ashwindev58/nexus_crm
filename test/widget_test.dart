import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nexus_crm/core/widgets/tittle_widget.dart';

void main() {
  testWidgets('TitleWidget renders text correctly', (WidgetTester tester) async {
    // Build TitleWidget and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TitleWidget(text: 'Test CRM Title'),
        ),
      ),
    );

    // Verify that our TitleWidget displays the correct text.
    expect(find.text('Test CRM Title'), findsOneWidget);
  });
}
