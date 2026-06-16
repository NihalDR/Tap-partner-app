import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tap/main.dart';

void main() {
  testWidgets('Tap Invest App login navigation and smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TapInvestApp());

    // Verify that we are on the Home Screen and see the main headline in RichText.
    expect(
      find.byWidgetPredicate(
        (widget) => widget is RichText && widget.text.toPlainText().contains('Home to your'),
      ),
      findsOneWidget,
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is RichText && widget.text.toPlainText().contains('Fixed Income Investments'),
      ),
      findsOneWidget,
    );

    // Verify that the Get Started button is visible.
    final getStartedButton = find.text('Get Started');
    expect(getStartedButton, findsOneWidget);

    // Tap the Get Started button and trigger page transition.
    await tester.tap(getStartedButton);
    await tester.pumpAndSettle();

    // Verify that the screen transitions to the LoginScreen.
    expect(find.text('Get started'), findsOneWidget);
    expect(find.text('Welcome to Tap Partner!'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('+91'), findsOneWidget);
    expect(find.text('Get OTP'), findsOneWidget);
    expect(find.text('Login via Email'), findsOneWidget);

    // Tap the back button on the LoginScreen to return to the HomeScreen.
    final backButton = find.byIcon(Icons.arrow_back);
    expect(backButton, findsOneWidget);
    await tester.tap(backButton);
    await tester.pumpAndSettle();

    // Verify we are back on the HomeScreen.
    expect(getStartedButton, findsOneWidget);

    // Tap the Investments tab on BottomNavigationBar.
    // Index 1 is Investments.
    await tester.tap(find.byIcon(Icons.account_balance_outlined));
    await tester.pumpAndSettle();

    // Verify that the screen transitions to the Investments tab (Why Tap?).
    expect(find.text('Why Tap?'), findsOneWidget);
    expect(find.textContaining('Unlock new avenues'), findsOneWidget);

    // Tap the Portfolio (Stats) tab on BottomNavigationBar.
    // Index 2 is Portfolio.
    await tester.tap(find.byIcon(Icons.pie_chart_outline));
    await tester.pumpAndSettle();

    // Verify that Stats screen is displayed.
    expect(find.text('Assets Managed'.toUpperCase()), findsOneWidget);
    expect(find.text('80,000+'), findsOneWidget);

    // Tap the Profile (Benefits) tab.
    // Index 3 is Profile.
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pumpAndSettle();

    // Verify that Benefits screen is displayed.
    expect(find.text("What's in it for you?"), findsOneWidget);
  });
}
