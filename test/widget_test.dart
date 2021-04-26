// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:buffaloretailgroupmap/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    
    expect(find.text('Buffalo Retail Group'), findsOneWidget);
    expect(find.text('Biggs and Company'), findsNothing);

   
    
    await tester.pump();

    // Verify that our counter has incremented.
   // expect(find.text('distance'), findsOneWidget);
    //expect(find.text('1'), findsOneWidget);
  });
}
