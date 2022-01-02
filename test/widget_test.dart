// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_register/ui/widget/outlined_button_green.dart';

void main() {
  testWidgets('login page login button test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: OutlinedButtonGreen(icon: Icons.login_outlined,
                                text: 'Login',
                                onPressed: (){}),
    ));

    // Verify that our button text is Login
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Logins'), findsNothing);    

    // Verify that our button icon is Icons.login_outlined.
    expect(find.byIcon(Icons.login_outlined), findsOneWidget);
    expect(find.byIcon(Icons.login), findsNothing);
  });
}
