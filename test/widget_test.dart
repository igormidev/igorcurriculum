import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:igorcurriculum/main.dart';

void main() {
  testWidgets('Curriculum home renders package content',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1600, 3200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 2));
    await tester.pump(const Duration(seconds: 6));

    expect(find.text('Igor miranda'), findsOneWidget);
    expect(find.textContaining('Flutter Specialist'), findsOneWidget);
    expect(find.textContaining('Babel text'), findsOneWidget);
  });
}
