import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_login_notification/pages/login/widgets/login_button.widget.dart';

void main() {
  testWidgets('renders the login button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginButton(text: 'Continuar', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Continuar'), findsOneWidget);
  });
}
