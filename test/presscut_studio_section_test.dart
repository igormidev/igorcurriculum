import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:igorcurriculum/sections/curriculum_sections.dart';
import 'package:igorcurriculum/sections/presscut_studio_section.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:igorcurriculum/shared/project_showcase_card.dart';

void main() {
  test(
      'Presscut is featured after Root Hub without replacing existing sections',
      () {
    expect(
      curriculumSections.map((section) => section.id),
      [
        'root-hub',
        'presscut-studio',
        'packages',
        'saas-attempts',
        'experience',
        'technical-edge',
      ],
    );
    expect(presscutStudioSectionData.tabLabel, 'Presscut Studio');
    expect(presscutStudioSectionData.subtitle, 'Open-source creator tool');
  });

  for (final width in [390.0, 1200.0]) {
    testWidgets(
        'Presscut card fits a $width px viewport and exposes both links',
        (tester) async {
      tester.view.devicePixelRatio = 1;
      tester.view.physicalSize = Size(width, 844);
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Builder(builder: presscutStudioSectionData.build),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final cardFinder = find.byType(ProjectShowcaseCard);
      expect(cardFinder, findsOneWidget);
      final card = tester.widget<ProjectShowcaseCard>(cardFinder);
      expect(card.titleLinkUrl, 'https://igormidev.github.io/presscut-studio/');
      expect(
        card.actions.map((action) => (action.label, action.url)),
        [
          (
            'Try Presscut Studio',
            'https://igormidev.github.io/presscut-studio/'
          ),
          (
            'Explore the source code',
            'https://github.com/igormidev/presscut-studio'
          ),
        ],
      );
      expect(card.imageAssetName, 'art/tumbnails/apps/presscut_studio.png');
      expect(card.description, contains('original sound'));
      expect(card.description, contains('typewriter and word reveals'));
      expect(card.description, contains('alpha-channel MOV'));

      final assetFinder = find.byType(OptimizedAsset);
      expect(assetFinder, findsOneWidget);
      await tester.ensureVisible(assetFinder);
      await tester.pumpAndSettle();
      final imageRect = tester.getRect(assetFinder);
      expect(imageRect.left, greaterThanOrEqualTo(0));
      expect(imageRect.right, lessThanOrEqualTo(width));
      expect(imageRect.size, const Size(190, 190));

      for (final label in ['Try Presscut Studio', 'Explore the source code']) {
        final actionFinder = find.text(label);
        expect(actionFinder, findsOneWidget);
        await tester.ensureVisible(actionFinder);
        await tester.pumpAndSettle();
        final actionRect = tester.getRect(actionFinder);
        expect(actionRect.left, greaterThanOrEqualTo(0));
        expect(actionRect.right, lessThanOrEqualTo(width));
        expect(actionRect.top, greaterThanOrEqualTo(0));
        expect(actionRect.bottom, lessThanOrEqualTo(844));
      }
      expect(tester.takeException(), isNull);
    });
  }
}
