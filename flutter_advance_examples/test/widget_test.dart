import 'package:flutter_advance_examples/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Test Text Route', (widgetTester) async {
    await widgetTester.pumpWidget(
      const MyWidget(title: 'T', message: 'M')
    );

    expect(find.text('T'), findsOneWidget);
  });
}
