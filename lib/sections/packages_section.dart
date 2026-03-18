import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';
import 'package:igorcurriculum/shared/project_showcase_card.dart';

const packagesSectionData = CurriculumSectionData(
  id: 'packages',
  title: 'My public packages',
  tabLabel: 'Open Source',
  subtitle: 'Open source projects',
  description:
      'In my Flutter developer career I built and published several open source packages. Here are the strongest examples.',
  buildChildren: _buildPackagesSectionChildren,
);

List<Widget> _buildPackagesSectionChildren(BuildContext context) => [
      const ProjectShowcaseCard(
        title: 'Flutter Package - Babel text',
        titleLinkUrl: 'https://pub.dev/packages/babel_text',
        onTitleTap: _logOpenedBabelTextPackage,
        shortDescription:
            '''A highly customizable <b>rich text package<b> for Flutter that turns inline markers into <sC>styles<sC>, <sC>taps<sC>, <sC>widgets<sC> and <sC>tooltips<sC>.

<soft>Use a simple string syntax<soft> to make text bold, clickable, selectable or enhanced with inline widgets without manually composing `<textSpanDocs>TextSpan<textSpanDocs>` trees.  ''',
        description:
            '''A highly customizable rich text package for Flutter focused on <b>dynamic text composition from a plain string<b>.

With <babelTextPkg><b>BabelText<b><babelTextPkg> and its related widgets, you can:
 - Map markers to text styles such as <sC>bold<sC>, <sC>italic<sC>, <sC>underline<sC> and themed colors
 - Attach callbacks to tappable text segments
 - Inject inline widgets in the middle of the text flow
 - Show hover tooltip messages for marked text
 - Use selectable variants for copyable rich text
 - Reuse app-wide default mappings for styles, widgets and interactions

<soft>It is a practical abstraction over manual `<textSpanDocs>TextSpan<textSpanDocs>` trees<soft> when you need interactive, expressive text with much less boilerplate.''',
        linkTags: {
          '<babelTextPkg>': 'https://pub.dev/packages/babel_text',
          '<textSpanDocs>':
              'https://api.flutter.dev/flutter/painting/TextSpan-class.html',
        },
        imageAssetName: 'art/tumbnails/packages/babel_text.png',
        size: Size(100, 100),
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Dart Package - Debouncer',
        titleLinkUrl: 'https://pub.dev/packages/dart_debouncer',
        onTitleTap: _logOpenedDebouncerPackage,
        shortDescription:
            '''A package for building <b>debounce flows in Dart<b> with support for <sC>multiple independent debouncer instances<sC>.

<soft>No singleton pattern required.<soft> It gives you a convenient way to control rapid user interactions such as button presses or text input changes.  ''',
        description:
            '''A package for building debounce flows in Dart with support for <b>multiple independent debouncer instances<b>.

<soft>No singleton pattern required.<soft> It helps control rapid user interactions, such as button presses or text input changes, to avoid <sC>unintended actions<sC>, unnecessary logic execution and noisy updates.''',
        imageAssetName: 'art/tumbnails/packages/debouncer.PNG',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Dart Package - Enchanted Collection toolkit',
        titleLinkUrl: 'https://pub.dev/packages/enchanted_collection',
        onTitleTap: _logOpenedEnchantedCollectionPackage,
        shortDescription:
            '''A <b>collection toolkit<b> with useful data structures and algorithms for day-to-day Dart collections.

<soft>List utilities, map helpers and casting helpers in one place.<soft>  ''',
        description:
            '''A collection toolkit of useful data structures and algorithms for collections.

<b>List utilities<b>
 - forEach mapper
 - mapper
 - singleWhereOrNull
 - Insert in index
 - Change element in index
 - Add value as the last element of a list
 - Split into groups
 - Detect mixed null / non-null content
 - Remove null elements from a list

<b>Map utilities<b>
 - Try-cast a map with null fallback

<b>Cast helpers<b>
 - Transform a list into a map
 - Transform a list into a map with a mapper
 - Transform a map into a list
 - Cast object / dynamic to a desired type''',
        imageAssetName: 'art/tumbnails/packages/enchanted_collection.PNG',
        size: Size(100, 100),
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Dart Package - Enchanted Regex',
        titleLinkUrl: 'https://pub.dev/packages/enchanted_regex',
        onTitleTap: _logOpenedEnchantedRegexPackage,
        shortDescription:
            '''A package that enhances the Dart <regExpDocs><b>RegExp API<b><regExpDocs>, especially when working with <sC>named groups<sC>.

<soft>It fills gaps around more advanced group manipulation and helper utilities.<soft>  ''',
        description:
            '''A package that enhances the Dart <regExpDocs><b>RegExp API<b><regExpDocs>, especially when working with <sC>named groups<sC>.

<soft>Dart already has a solid regex foundation.<soft> This package was created to cover some more advanced needs, especially around better group handling and auxiliary operations that are useful in real parsing workflows.''',
        linkTags: {
          '<regExpDocs>': 'https://api.dart.dev/dart-core/RegExp-class.html',
        },
        imageAssetName: 'art/tumbnails/packages/enchanted_regex.PNG',
        size: Size(100, 100),
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Dart Package - Sandbox logger',
        titleLinkUrl: 'https://pub.dev/packages/sandbox_logger',
        onTitleTap: _logOpenedSandboxLoggerPackage,
        shortDescription:
            '''A simple tool for <b>beautiful and colorful console output<b>.

<b>Features<b>
- <soft>Log in multiple colors<soft>''',
        description:
            '''A simple tool for more beautiful and colorful console output.

<b>Features<b>
- Log in multiple colors
- Log texts, maps and objects
- Log errors and stack traces
- Control the maximum horizontal length of logs''',
        imageAssetName: 'art/tumbnails/packages/sandbox_logger.PNG',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Flutter Package - YT shorts display package',
        titleLinkUrl: 'https://pub.dev/packages/youtube_shorts',
        onTitleTap: _logOpenedYoutubeShortsPackage,
        shortDescription:
            '''A package for displaying <b>vertical YouTube Shorts<b>.

<soft>You choose what shorts will be displayed<soft> by passing a list of Shorts URLs or a channel name.  ''',
        description:
            '''A package for displaying <b>vertical YouTube Shorts<b>.

You choose what shorts will be displayed by passing a list of Shorts URLs or a channel name. Under the hood, the package uses <youtubeExplode><b>youtube_explode_dart<b><youtubeExplode> to get YouTube video information and <mediaKit><b>media_kit<b><mediaKit> as the player for the videos.''',
        linkTags: {
          '<youtubeExplode>': 'https://pub.dev/packages/youtube_explode_dart',
          '<mediaKit>': 'https://pub.dev/packages/media_kit',
        },
        imageAssetName: 'art/tumbnails/packages/shorts.PNG',
        size: Size(110, 100),
        cacheHeight: 220,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Flutter Package - Field autocomplete',
        titleLinkUrl: 'https://pub.dev/packages/cursor_autocomplete_options',
        onTitleTap: _logOpenedAutocompletePackage,
        imageAssetName: 'art/tumbnails/packages/cursor_autocomplete.JPEG',
        shortDescription:
            '''Autocomplete dialog in a text field for <b>desktop applications<b>.

<soft>Flutter already has an <autocompleteWidget>autocomplete widget<autocompleteWidget>,<soft> but it does not match the expected UI pattern commonly seen on desktop and web.  ''',
        description:
            '''Autocomplete dialog in a text field for desktop applications.

<soft>Flutter already has an <autocompleteWidget>autocomplete widget<autocompleteWidget>,<soft> but the default experience does not match the expected UI pattern commonly seen on desktop and web. This package makes it possible to display an <b>overlay list of options right below the cursor indicator<b>, with each autocomplete option rendered as a list tile.''',
        linkTags: {
          '<autocompleteWidget>':
              'https://api.flutter.dev/flutter/material/Autocomplete-class.html',
        },
        size: Size(130, 100),
        actions: [
          ProjectShowcaseAction(
            label: 'Test the live demo',
            url: 'https://igormidev.github.io/cursor_autocomplete_options/',
            onTap: _logOpenedAutocompleteLiveDemo,
          ),
        ],
        cacheHeight: 260,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: 'Flutter Package - Pricing page',
        titleLinkUrl: 'https://pub.dev/packages/pricing_page',
        onTitleTap: _logOpenedPricingPagePackage,
        imageAssetName: 'art/tumbnails/packages/pricing_page.png',
        shortDescription:
            '''A pre-made responsive pricing page component for Flutter with built-in async loading feedback and <b>polished plan cards<b>.

It helps you ship subscription or pricing UI quickly, including monthly and yearly billing presentation, without building the full screen from scratch.  ''',
        description:
            '''A pre-made pricing page component for Flutter focused on <b>fast setup of subscription and plan-selection screens<b>.

With <pricingPagePkg><b>PricingBackground<b><pricingPagePkg>, <pricingPagePkg><b>PricingPage<b><pricingPagePkg> and <pricingPagePkg><b>PricesModel<b><pricingPagePkg>, you can:
 - Define multiple pricing tiers with monthly and yearly prices
 - Get automatic loading-state handling for async CTA button actions
 - Use a responsive mobile layout with desktop side-by-side pricing cards
 - Choose between equal-height desktop cards or content-sized columns
 - Customize the decoration, typography and overall visual styling
 - Format feature strings with <babelTextPkg><sC>babel_text support<sC><babelTextPkg>

<soft>It is a practical shortcut when you want a polished pricing experience quickly,<soft> while still keeping good control over the final UI.''',
        linkTags: {
          '<babelTextPkg>': 'https://pub.dev/packages/babel_text',
          '<pricingPagePkg>': 'https://pub.dev/packages/pricing_page',
        },
        size: Size(140, 100),
        fit: BoxFit.contain,
        actions: [
          ProjectShowcaseAction(
            label: 'Test the live demo',
            url: 'https://go-babel.github.io/pricing_page/',
            onTap: _logOpenedPricingPageLiveDemo,
          ),
        ],
        cacheHeight: 307,
        cacheWidth: 375,
      ),
    ];

void _logOpenedBabelTextPackage() =>
    AnalyticsService.instance.logOpenedPackage('babel_text');
void _logOpenedDebouncerPackage() =>
    AnalyticsService.instance.logOpenedPackage('dart_debouncer');
void _logOpenedEnchantedCollectionPackage() =>
    AnalyticsService.instance.logOpenedPackage('enchanted_collection');
void _logOpenedEnchantedRegexPackage() =>
    AnalyticsService.instance.logOpenedPackage('enchanted_regex');
void _logOpenedSandboxLoggerPackage() =>
    AnalyticsService.instance.logOpenedPackage('sandbox_logger');
void _logOpenedYoutubeShortsPackage() =>
    AnalyticsService.instance.logOpenedPackage('youtube_shorts');
void _logOpenedAutocompletePackage() =>
    AnalyticsService.instance.logOpenedPackage('autocomplete_textfield');
void _logOpenedPricingPagePackage() =>
    AnalyticsService.instance.logOpenedPackage('pricing_page');
void _logOpenedAutocompleteLiveDemo() =>
    AnalyticsService.instance.logOpenedLiveDemo('autocomplete_textfield');
void _logOpenedPricingPageLiveDemo() =>
    AnalyticsService.instance.logOpenedLiveDemo('pricing_page_demo');
