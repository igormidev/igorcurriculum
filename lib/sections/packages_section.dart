import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:url_launcher/url_launcher.dart';

List<Widget> packagesSection(BuildContext context) => [
      SizedBox(
        height: 30,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'My public packages',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            TextSpan(
              text: ' • Open source projects',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 23,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ]),
        ),
      ),
      const SizedBox(height: 8),
      SizedBox(
        height: 45,
        child: Text(
          'In my flutter developer carrer I developed some open source packages projects. Bellow you can see some of them.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.outline,
            fontSize: 16,
          ),
        ),
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Flutter Package - Babel text  ',
        logName: 'babel_text',
        linkUrl: 'https://pub.dev/packages/babel_text',
        shortDescription:
            '''💡 A highly customizable rich text package for Flutter that turns inline markers into styles, taps, widgets and tooltips.

Use a simple string syntax to make text bold, clickable, selectable or enhanced with inline widgets without manually composing `TextSpan`s.  ''',
        description:
            '''💡 A highly customizable rich text package for Flutter focused on dynamic text composition from a plain string.

With `BabelText` and its related widgets, you can:
 ⦿ Map markers to text styles such as bold, italic, underline and themed colors
 ⦿ Attach callbacks to tappable text segments
 ⦿ Inject inline widgets in the middle of the text flow
 ⦿ Show hover tooltip messages for marked text
 ⦿ Use selectable variants for copyable rich text
 ⦿ Reuse app-wide default mappings for styles, widgets and interactions

It is a practical abstraction over manual `TextSpan` trees when you need interactive, expressive text with much less boilerplate.''',
        imageUrl: 'babel_text.png',
        size: Size(100, 100),
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Dart Package - Debouncer  ',
        logName: 'dart_debouncer',
        linkUrl: 'https://pub.dev/packages/dart_debouncer',
        shortDescription:
            '''💡 A package for creating debounce in dart will possibilities of multi instances debounce
𝘞𝘪𝘵𝘩 𝘯𝘰 𝘴𝘪𝘯𝘨𝘭𝘦𝘵𝘰𝘯 𝘱𝘢𝘵𝘵𝘦𝘳𝘯, 𝘵𝘩𝘪𝘴 𝘱𝘢𝘤𝘬𝘢𝘨𝘦 𝘱𝘳𝘰𝘷𝘪𝘥𝘦𝘴 𝘢 𝘤𝘰𝘯𝘷𝘦𝘯𝘪𝘦𝘯𝘵  ''',
        description:
            '''💡 A package for creating debounce in dart will possibilities of multi instances debounce
𝘞𝘪𝘵𝘩 𝘯𝘰 𝘴𝘪𝘯𝘨𝘭𝘦𝘵𝘰𝘯 𝘱𝘢𝘵𝘵𝘦𝘳𝘯, 𝘵𝘩𝘪𝘴 𝘱𝘢𝘤𝘬𝘢𝘨𝘦 𝘱𝘳𝘰𝘷𝘪𝘥𝘦𝘴 𝘢 𝘤𝘰𝘯𝘷𝘦𝘯𝘪𝘦𝘯𝘵 𝘸𝘢𝘺 𝘵𝘰 𝘩𝘢𝘯𝘥𝘭𝘦 𝘥𝘦𝘣𝘰𝘶𝘯𝘤𝘪𝘯𝘨 𝘴𝘤𝘦𝘯𝘢𝘳𝘪𝘰𝘴 𝘧𝘰𝘳 𝘶𝘴𝘦𝘳 𝘪𝘯𝘵𝘦𝘳𝘢𝘤𝘵𝘪𝘰𝘯𝘴, 𝘴𝘶𝘤𝘩 𝘢𝘴 𝘣𝘶𝘵𝘵𝘰𝘯 𝘱𝘳𝘦𝘴𝘴𝘦𝘴 𝘰𝘳 𝘵𝘦𝘹𝘵 𝘪𝘯𝘱𝘶𝘵 𝘤𝘩𝘢𝘯𝘨𝘦𝘴, 𝘪𝘯 𝘰𝘳𝘥𝘦𝘳 𝘵𝘰 𝘦𝘯𝘩𝘢𝘯𝘤𝘦 𝘵𝘩𝘦 𝘶𝘴𝘦𝘳 𝘦𝘹𝘱𝘦𝘳𝘪𝘦𝘯𝘤𝘦 𝘢𝘯𝘥 𝘢𝘷𝘰𝘪𝘥 𝘶𝘯𝘪𝘯𝘵𝘦𝘯𝘥𝘦𝘥 𝘢𝘤𝘵𝘪𝘰𝘯𝘴, 𝘶𝘯𝘯𝘦𝘤𝘦𝘴𝘴𝘢𝘳𝘺 𝘭𝘰𝘨𝘪𝘤 𝘦𝘹𝘦𝘤𝘶𝘵𝘪𝘰𝘯 𝘰𝘳 𝘧𝘳𝘦𝘲𝘶𝘦𝘯𝘵 𝘶𝘱𝘥𝘢𝘵𝘦𝘴.''',
        imageUrl: 'debouncer.PNG',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Dart Package - Enchanted Collection toolkit ',
        logName: 'enchanted_collection',
        linkUrl: 'https://pub.dev/packages/enchanted_collection',
        shortDescription:
            '''💡 A collection toolkit of useful data structures and algorithms for collections.

List util's
 ⦿ For each mapper  ''',
        description:
            '''💡 A collection toolkit of useful data structures and algorithms for collections.

List util's
 ⦿ For each mapper
 ⦿ Mapper
 ⦿ Single where or null
 ⦿ Insert in index
 ⦿ Change element in index
 ⦿ Add value as last element of list
 ⦿ Split into groups
 ⦿ Is any element diferent from null AND is any element null
 ⦿ Remove null elements of a list
Map util's
 ⦿ Try cast map ( Return null if not possible )
Cast functions
 ⦿ Transform a list into a map
 ⦿ Transform a list into a map with mapper
 ⦿ Transform a map into a list
 ⦿ Cast object/dynamic to desired type  ''',
        imageUrl: 'enchanted_collection.PNG',
        size: Size(100, 100),
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Dart Package - Enchanted Regex  ',
        logName: 'enchanted_regex',
        linkUrl: 'https://pub.dev/packages/enchanted_regex',
        shortDescription:
            '''💡A package that enhances dart regex api. Mainly when working with named group's.\n
𝘛𝘩𝘢𝘵'𝘴 𝘣𝘦𝘤𝘢𝘶𝘴𝘦 𝘋𝘢𝘳𝘵 𝘳𝘦𝘨𝘦𝘹 𝘢𝘱𝘪 𝘪𝘴 𝘢 𝘨𝘰𝘰𝘥 𝘴𝘰𝘭𝘪𝘥 𝘣𝘢𝘴𝘦 𝘰𝘧 𝘢  ''',
        description:
            '''💡A package that enhances dart regex api. Mainly when working with named group's.\n
𝘛𝘩𝘢𝘵'𝘴 𝘣𝘦𝘤𝘢𝘶𝘴𝘦 𝘋𝘢𝘳𝘵 𝘳𝘦𝘨𝘦𝘹 𝘢𝘱𝘪 𝘪𝘴 𝘢 𝘨𝘰𝘰𝘥 𝘴𝘰𝘭𝘪𝘥 𝘣𝘢𝘴𝘦 𝘰𝘧 𝘢 𝘮𝘰𝘥𝘦𝘳𝘯 𝘳𝘦𝘨𝘦𝘹 𝘪𝘮𝘱𝘭𝘦𝘮𝘦𝘯𝘵𝘢𝘵𝘪𝘰𝘯. 𝘉𝘶𝘵 𝘪𝘵 𝘴𝘵𝘪𝘭𝘭 𝘭𝘢𝘤𝘬𝘴 𝘴𝘰𝘮𝘦 𝘮𝘰𝘳𝘦 𝘤𝘰𝘮𝘱𝘭𝘦𝘹 𝘧𝘶𝘯𝘤𝘵𝘪𝘰𝘯𝘴 (𝘴𝘶𝘤𝘩 𝘢𝘴 𝘣𝘦𝘵𝘵𝘦𝘳 𝘮𝘢𝘯𝘪𝘱𝘶𝘭𝘢𝘵𝘪𝘯𝘨 𝘨𝘳𝘰𝘶𝘱𝘴) 𝘢𝘯𝘥 𝘴𝘰𝘮𝘦 𝘢𝘶𝘹𝘪𝘭𝘪𝘢𝘳𝘺 𝘧𝘶𝘯𝘤𝘵𝘪𝘰𝘯𝘴. 𝘉𝘦𝘤𝘢𝘶𝘴𝘦 𝘰𝘧 𝘵𝘩𝘦𝘴𝘦 "𝘱𝘳𝘰𝘣𝘭𝘦𝘮𝘴", 𝘵𝘩𝘪𝘴 𝘱𝘢𝘤𝘬𝘢𝘨𝘦 𝘸𝘢𝘴 𝘤𝘳𝘦𝘢𝘵𝘦𝘥.  ''',
        imageUrl: 'enchanted_regex.PNG',
        size: Size(100, 100),
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Dart Package - Sandbox logger  ',
        logName: 'sandbox_logger',
        linkUrl: 'https://pub.dev/packages/sandbox_logger',
        shortDescription:
            '''💡 A simple tool for more beautiful and colorful console prints.  
              
𝐅𝐞𝐚𝐭𝐮𝐫𝐞𝐬
- 𝘓𝘰𝘨 𝘪𝘯 𝘮𝘶𝘭𝘵𝘪𝘱𝘭𝘦 𝘤𝘰𝘭𝘰𝘳𝘴 ''',
        description:
            '''💡 A simple tool for more beautiful and colorful console prints.

𝐅𝐞𝐚𝐭𝐮𝐫𝐞𝐬
- 𝘓𝘰𝘨 𝘪𝘯 𝘮𝘶𝘭𝘵𝘪𝘱𝘭𝘦 𝘤𝘰𝘭𝘰𝘳𝘴 
- 𝘓𝘰𝘨 𝘵𝘦𝘹𝘵𝘴 - 𝘓𝘰𝘨 𝘔𝘢𝘱𝘴 
- 𝘓𝘰𝘨 𝘌𝘳𝘳𝘰𝘳'𝘴/𝘴𝘵𝘢𝘤𝘬𝘵𝘳𝘢𝘤𝘦
- 𝘓𝘰𝘨 𝘖𝘣𝘫𝘦𝘤𝘵𝘴 
- 𝘋𝘦𝘵𝘦𝘳𝘮𝘪𝘯𝘦 𝘭𝘰𝘨𝘴 𝘮𝘢𝘹 𝘩𝘰𝘳𝘪𝘻𝘰𝘯𝘵𝘢𝘭 𝘭𝘦𝘯𝘨𝘵𝘩  ''',
        imageUrl: 'sandbox_logger.PNG',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Flutter Package -  YT shorts display package  ',
        logName: 'youtube_shorts',
        linkUrl: 'https://pub.dev/packages/youtube_shorts',
        shortDescription: '''💡A package for displaying vertical youtube shorts.

𝘠𝘰𝘶 𝘤𝘢𝘯 𝘤𝘩𝘰𝘰𝘴𝘦 𝘸𝘩𝘢𝘵 𝘴𝘩𝘰𝘳𝘵𝘴 𝘸𝘪𝘭𝘭 𝘣𝘦 𝘥𝘪𝘴𝘱𝘭𝘢𝘺𝘦𝘥 𝘣𝘺  ''',
        description: '''💡A package for displaying vertical youtube shorts.
          
𝘠𝘰𝘶 𝘤𝘢𝘯 𝘤𝘩𝘰𝘰𝘴𝘦 𝘸𝘩𝘢𝘵 𝘴𝘩𝘰𝘳𝘵𝘴 𝘸𝘪𝘭𝘭 𝘣𝘦 𝘥𝘪𝘴𝘱𝘭𝘢𝘺𝘦𝘥 𝘣𝘺 𝘱𝘢𝘴𝘴𝘪𝘯𝘨 𝘢 𝘭𝘪𝘴𝘵 𝘰𝘧 𝘴𝘩𝘰𝘳𝘵𝘴 𝘶𝘳𝘭'𝘴 𝘰𝘳 𝘣𝘺 𝘱𝘢𝘴𝘴𝘪𝘯𝘨 𝘢 𝘤𝘩𝘢𝘯𝘯𝘦𝘭 𝘯𝘢𝘮𝘦. 𝘜𝘯𝘥𝘦𝘳 𝘵𝘩𝘦 𝘩𝘰𝘰𝘥 𝘵𝘩𝘦 𝘱𝘢𝘤𝘬𝘢𝘨𝘦 𝘪𝘴 𝘶𝘴𝘪𝘯𝘨 𝘺𝘰𝘶𝘵𝘶𝘣𝘦_𝘦𝘹𝘱𝘭𝘰𝘥𝘦_𝘥𝘢𝘳𝘵 𝘵𝘰 𝘨𝘦𝘵 𝘺𝘰𝘶𝘵𝘶𝘣𝘦 𝘷𝘪𝘥𝘦𝘰 𝘪𝘯𝘧𝘰 𝘢𝘯𝘥 𝘮𝘦𝘥𝘪𝘢_𝘬𝘪𝘵 𝘢𝘴 𝘵𝘩𝘦 𝘱𝘭𝘢𝘺𝘦𝘳 𝘧𝘰𝘳 𝘷𝘪𝘥𝘦𝘰𝘴.  ''',
        imageUrl: 'shorts.PNG',
        size: Size(110, 100),
        cacheHeight: 220,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Flutter Package - Field autocomplete  ',
        logName: 'autocomplete_textfield',
        imageUrl: 'cursor_autocomplete.JPEG',
        shortDescription:
            '''💡Autocomplete dialog in textfield for desktop applications

𝘍𝘭𝘶𝘵𝘵𝘦𝘳 𝘢𝘭𝘳𝘦𝘢𝘥𝘺 𝘩𝘢𝘷𝘦 𝘢 𝘢𝘶𝘵𝘰𝘤𝘰𝘮𝘱𝘭𝘦𝘵𝘦 𝘸𝘪𝘥𝘨𝘦𝘵. 𝘉𝘶𝘵 𝘪𝘵 𝘥𝘰𝘴𝘦𝘯'𝘵 𝘮𝘢𝘵𝘤𝘩 𝘵𝘩𝘦 𝘦𝘹𝘱𝘦𝘤𝘵𝘦𝘥 𝘶𝘪 𝘱𝘢𝘵𝘵𝘦𝘳𝘯 𝘵𝘩𝘢𝘵 𝘯𝘰𝘳𝘮𝘢𝘭𝘺 𝘸𝘦 𝘴𝘦𝘦 𝘪𝘯  ''',
        description:
            '''💡Autocomplete dialog in textfield for desktop applications
          
𝘍𝘭𝘶𝘵𝘵𝘦𝘳 𝘢𝘭𝘳𝘦𝘢𝘥𝘺 𝘩𝘢𝘷𝘦 𝘢 𝘢𝘶𝘵𝘰𝘤𝘰𝘮𝘱𝘭𝘦𝘵𝘦 𝘸𝘪𝘥𝘨𝘦𝘵. 𝘉𝘶𝘵 𝘪𝘵 𝘥𝘰𝘴𝘦𝘯'𝘵 𝘮𝘢𝘵𝘤𝘩 𝘵𝘩𝘦 𝘦𝘹𝘱𝘦𝘤𝘵𝘦𝘥 𝘶𝘪 𝘱𝘢𝘵𝘵𝘦𝘳𝘯 𝘵𝘩𝘢𝘵 𝘯𝘰𝘳𝘮𝘢𝘭𝘺 𝘸𝘦 𝘴𝘦𝘦 𝘪𝘯 𝘥𝘦𝘴𝘬𝘵𝘰𝘱 𝘢𝘯𝘥 𝘸𝘦𝘣 𝘷𝘦𝘳𝘴𝘪𝘰𝘯𝘴.\n𝘛𝘩𝘢𝘵'𝘴 𝘣𝘦𝘤𝘢𝘶𝘴𝘦 𝘵𝘩𝘦 𝘢𝘶𝘵𝘰𝘤𝘰𝘮𝘱𝘭𝘦𝘵𝘦 𝘴𝘦𝘤𝘵𝘪𝘰𝘯 𝘪𝘴 𝘣𝘦𝘭𝘭𝘰𝘸 𝘵𝘩𝘦 𝘵𝘦𝘹𝘵𝘧𝘪𝘦𝘭𝘥 𝘢𝘯𝘥 𝘸𝘦 𝘤𝘢𝘯'𝘵 𝘤𝘩𝘢𝘯𝘨𝘦 𝘵𝘩𝘢𝘵 𝘪𝘯 𝘵𝘩𝘦 𝘢𝘶𝘵𝘰𝘤𝘰𝘮𝘱𝘭𝘦𝘵𝘦 𝘢𝘱𝘪.\n\n𝘍𝘰𝘳 𝘵𝘩𝘢𝘵 𝘳𝘦𝘢𝘴𝘰𝘯 𝘵𝘩𝘪𝘴 𝘱𝘢𝘤𝘬𝘢𝘨𝘦 𝘩𝘢𝘴 𝘣𝘦𝘦𝘯 𝘮𝘢𝘥𝘦. 𝘛𝘰 𝘨𝘪𝘷𝘦 𝘵𝘩𝘦 𝘱𝘰𝘴𝘴𝘪𝘣𝘪𝘭𝘪𝘵𝘺 𝘵𝘰 𝘥𝘪𝘴𝘱𝘭𝘢𝘺 𝘢 𝘭𝘪𝘴𝘵𝘷𝘪𝘦𝘸 𝘰𝘧 𝘰𝘱𝘵𝘪𝘰𝘯𝘴 𝘳𝘪𝘨𝘩𝘵 𝘣𝘦𝘭𝘭𝘰𝘸 𝘵𝘩𝘦 𝘤𝘶𝘳𝘴𝘰𝘳 𝘪𝘯𝘥𝘪𝘤𝘢𝘵𝘰𝘳 𝘸𝘪𝘵𝘩 𝘦𝘢𝘤𝘩 𝘢𝘶𝘵𝘰𝘤𝘰𝘮𝘱𝘭𝘦𝘵𝘪𝘰𝘯 𝘰𝘱𝘵𝘪𝘰𝘯 𝘪𝘯 𝘢 𝘭𝘪𝘴𝘵 𝘵𝘪𝘭𝘦 𝘥𝘪𝘴𝘱𝘭𝘢𝘺𝘦𝘥 𝘪𝘯 𝘢 𝘰𝘷𝘦𝘳𝘭𝘢𝘺.  ''',
        linkUrl: 'https://pub.dev/packages/cursor_autocomplete_options',
        size: Size(130, 100),
        liveDemoUrl: 'https://igormidev.github.io/cursor_autocomplete_options/',
        liveDemoLogName: 'autocomplete_textfield',
        cacheHeight: 260,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ProjectsDemonstration(
        title: ' 📦 Flutter Package - Pricing page  ',
        logName: 'pricing_page',
        imageUrl: 'pricing_page.png',
        shortDescription:
            '''💡 A pre-made responsive pricing page component for Flutter with built-in async loading feedback and polished plan cards.

It helps you ship subscription or pricing UI quickly, including monthly and yearly billing presentation, without building the full screen from scratch.  ''',
        description:
            '''💡 A pre-made pricing page component for Flutter focused on fast setup of subscription and plan-selection screens.

With `PricingBackground`, `PricingPage` and `PricesModel`, you can:
 ⦿ Define multiple pricing tiers with monthly and yearly prices
 ⦿ Get automatic loading-state handling for async CTA button actions
 ⦿ Use a responsive mobile layout with desktop side-by-side pricing cards
 ⦿ Choose between equal-height desktop cards or content-sized columns
 ⦿ Customize the decoration, typography and overall visual styling
 ⦿ Format feature strings with `babel_text` support

It is a practical shortcut when you want a polished pricing experience quickly, while still keeping good control over the final UI.''',
        linkUrl: 'https://pub.dev/packages/pricing_page',
        size: Size(140, 100),
        fit: BoxFit.contain,
        liveDemoUrl: 'https://go-babel.github.io/pricing_page/',
        liveDemoLogName: 'pricing_page_demo',
        cacheHeight: 307,
        cacheWidth: 375,
      ),
    ];

class ProjectsDemonstration extends StatefulWidget {
  final String title;
  final String description;
  final String shortDescription;
  final String imageUrl;
  final String linkUrl;
  final Size? size;
  final String? liveDemoLogName;
  final String? liveDemoUrl;
  final String logName;
  final int cacheWidth;
  final int cacheHeight;
  final BoxFit fit;

  const ProjectsDemonstration({
    super.key,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.imageUrl,
    required this.linkUrl,
    required this.logName,
    required this.cacheWidth,
    required this.cacheHeight,
    this.fit = BoxFit.cover,
    this.size,
    this.liveDemoUrl,
    this.liveDemoLogName,
  });

  @override
  State<ProjectsDemonstration> createState() => _ProjectsDemonstrationState();
}

class _ProjectsDemonstrationState extends State<ProjectsDemonstration> {
  bool showShortDescription = true;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.outline,
      fontSize: 13,
    );
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        AnalyticsService.instance
                            .logOpenedPackage(widget.logName);
                        launchUrl(Uri.parse(widget.linkUrl));
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Text(
                                widget.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.open_in_new_rounded),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          if (showShortDescription) ...{
                            TextSpan(
                              text: widget.shortDescription,
                              style: style,
                            ),
                            TextSpan(
                              text: 'See more',
                              style: style.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    showShortDescription = false;
                                  });
                                },
                            ),
                          } else ...{
                            TextSpan(
                              text: widget.description,
                              style: style,
                            ),
                            TextSpan(
                              text: 'See less',
                              style: style.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    showShortDescription = true;
                                  });
                                },
                            ),
                          },
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              OptimizedAsset(
                assetName: 'art/tumbnails/packages/${widget.imageUrl}',
                height: widget.size?.height ?? 67,
                width: widget.size?.width ?? 120,
                fit: widget.fit,
                cacheWidth: widget.cacheWidth,
                cacheHeight: widget.cacheHeight,
              ),
            ],
          ),
          if (widget.liveDemoUrl != null) ...{
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                launchUrl(Uri.parse(widget.liveDemoUrl!));
                if (widget.liveDemoLogName != null) {
                  AnalyticsService.instance
                      .logOpenedLiveDemo(widget.liveDemoLogName!);
                }
              },
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Row(children: [
                        Text(
                          '  🌟 Test the live demo! ',
                          // widget.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.open_in_new_rounded),
                        SizedBox(width: 8),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          }
        ],
      ),
    );
  }
}
