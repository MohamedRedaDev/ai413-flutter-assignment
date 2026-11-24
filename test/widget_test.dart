import 'package:ai413_assignment/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navigation works: Home -> About -> Contact', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Home Page'), findsOneWidget);

    await tester.tap(find.text('Go to About'));
    await tester.pumpAndSettle();
    expect(find.text('About Page'), findsOneWidget);

    await tester.tap(find.text('Go to Contact'));
    await tester.pumpAndSettle();
    expect(find.text('Contact Page'), findsOneWidget);
  });
}