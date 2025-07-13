import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:real_time_chatting/main.dart';

void main() {
  testWidgets('App initializes without errors', (WidgetTester tester) async {
    // Wrap in ProviderScope since the app uses Riverpod
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );
    
    // If we get here without errors, the test passes
    expect(true, isTrue);
    
    // Verify that a MaterialApp is created
    expect(find.byType(MaterialApp), findsOneWidget);
    
    // Print a debug message to confirm test execution
    debugPrint('[DEBUG_LOG] App initialization test completed successfully');
  });
}