import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

const _name = 'Igor Miranda';
const _headline = 'Senior Dart / Flutter Specialist';
const _subheadline =
    'Flutter specialist building production apps since the Flutter beta era.';
const _outputFileName = 'igor_miranda_dart_flutter_resume.pdf';

const _summaryBullets = [
  'Senior Dart and Flutter engineer with deep production experience across mobile, web, package authoring, architecture, backend systems, and production delivery.',
  'Top Rated Upwork freelancer with 100% job success and a track record of shipping client-facing products with strong communication and delivery discipline.',
  'Strong depth in Flutter performance, widget lifecycle management, element and render tree behavior, DevTools profiling, deep links, internationalization, offline-first flows, analytics integration, testability, and backend range across Serverpod, Supabase, Firebase, dart_frog, shelf, Aqueduct, and gRPC.',
];

const _keywordLines = [
  'Languages and frameworks: Dart, Flutter, Flutter Web, Serverpod, Firebase, Supabase, dart_frog, shelf, Aqueduct, gRPC.',
  'State and navigation: BLoC, Riverpod, GetX, MobX, Triple, Flutter Hooks, go_router, auto_route, flutter_modular, deep linking.',
  'Product and quality: PostHog, Firebase Analytics, AppsFlyer, mocktail, Mockito, DevTools, offline-first, sync, realtime, performance optimization, package-based monorepos, clean architecture, custom lints, RLS.',
];

const _contactLinks = [
  _ContactLink(
    label: 'Email',
    text: 'igor-devwork@outlook.com',
    url: 'mailto:igor-devwork@outlook.com',
  ),
  _ContactLink(
    label: 'Portfolio',
    text: 'https://igorcurriculum.com',
    url: 'https://igorcurriculum.com',
  ),
  _ContactLink(
    label: 'GitHub',
    text: 'https://github.com/igormidev',
    url: 'https://github.com/igormidev',
  ),
  _ContactLink(
    label: 'LinkedIn',
    text: 'https://www.linkedin.com/in/igor-midev/',
    url: 'https://www.linkedin.com/in/igor-midev/',
  ),
  _ContactLink(
    label: 'Upwork',
    text: 'https://www.upwork.com/freelancers/igormidev',
    url: 'https://www.upwork.com/freelancers/igormidev',
  ),
  _ContactLink(
    label: 'WhatsApp',
    text: 'https://wa.me/5521967103488',
    url: 'https://wa.me/5521967103488',
  ),
];

const _experienceEntries = [
  _ExperienceEntry(
    title: 'Freelance Senior Flutter Engineer',
    companyOrContext: 'Upwork',
    period: 'Mar 2023 - Present',
    link: 'https://www.upwork.com/freelancers/igormidev',
    bullets: [
      'Earned Top Rated status with 100% job success while delivering production Flutter work directly to clients.',
      'Built long-term client relationships by prioritizing product quality, clear status updates, and pragmatic execution.',
    ],
  ),
  _ExperienceEntry(
    title: 'Senior Flutter Engineer',
    companyOrContext: 'Football social app with 800k+ downloads',
    period: 'Apr 2023 - Present',
    link:
        'https://play.google.com/store/apps/details?id=dreamstock.com.dreamstock&hl=pt_BR&gl=US',
    bullets: [
      'Delivered Pix payments, feed performance improvements, club selection queries, post UX refactors, in-app banners, ranking and badge systems, crowdfunding flows, and YouTube Shorts integration.',
      'Created the public youtube_shorts package to encapsulate reusable Shorts playback logic used in production.',
    ],
  ),
  _ExperienceEntry(
    title: 'Senior Flutter Engineer',
    companyOrContext: 'Alinea Health',
    period: 'Apr 2023 - Dec 2023',
    link:
        'https://play.google.com/store/apps/details?id=br.com.alineahealth.app&hl=pt&gl=US',
    bullets: [
      'Contributed to a health-plan product, including production deliveries around video streaming and chat with providers.',
      'Shipped features inside a task-demand freelance model while working in a health-related product context.',
    ],
  ),
  _ExperienceEntry(
    title: 'Tech Lead',
    companyOrContext: 'Target Bank and Target Fleet',
    period: 'Feb 2022 - Apr 2023',
    link:
        'https://apps.apple.com/br/app/target-conta-digital/id1590916424?l=en',
    secondaryLink:
        'https://play.google.com/store/apps/details?id=br.com.targetmp.cartaofrota&hl=pt_BR&gl=US',
    secondaryLinkLabel: 'Fleet app link',
    bullets: [
      'Designed maintainable and scalable Flutter architecture for banking and fleet-payment products.',
      'Led delivery of smooth, reliable apps for truck-driver digital banking and accredited gas-station payment operations.',
    ],
  ),
];

const _packageEntries = [
  _LinkedEntry(
    title: 'babel_text',
    url: 'https://pub.dev/packages/babel_text',
    description:
        'Rich text composition from marker-based strings, with styles, callbacks, tooltips, and inline widgets.',
  ),
  _LinkedEntry(
    title: 'pricing_page',
    url: 'https://pub.dev/packages/pricing_page',
    description:
        'Responsive pricing UI for Flutter with async CTA loading states and polished plan presentation.',
  ),
  _LinkedEntry(
    title: 'dart_debouncer',
    url: 'https://pub.dev/packages/dart_debouncer',
    description:
        'Multi-instance debounce flows in pure Dart for buttons, inputs, and other rapid user interactions.',
  ),
  _LinkedEntry(
    title: 'enchanted_collection',
    url: 'https://pub.dev/packages/enchanted_collection',
    description:
        'Collection helpers and utility algorithms for day-to-day Dart development.',
  ),
  _LinkedEntry(
    title: 'enchanted_regex',
    url: 'https://pub.dev/packages/enchanted_regex',
    description:
        'RegExp helpers focused on advanced group handling and practical parsing workflows.',
  ),
  _LinkedEntry(
    title: 'youtube_shorts',
    url: 'https://pub.dev/packages/youtube_shorts',
    description:
        'Production-oriented Flutter package for vertical YouTube Shorts playback.',
  ),
  _LinkedEntry(
    title: 'cursor_autocomplete_options',
    url: 'https://pub.dev/packages/cursor_autocomplete_options',
    description:
        'Desktop and web style autocomplete overlay aligned to the text cursor.',
  ),
];

const _productEntries = [
  _LinkedEntry(
    title: 'ZenScrap',
    url: 'https://github.com/igormidev/zenscrap',
    description:
        'AI-assisted web scraping SaaS that turned natural-language extraction requests into tested scrapers and reusable APIs. Built as a multi-service Dart system with Serverpod, Flutter, analytics, billing, and a self-healing repair loop.',
  ),
  _LinkedEntry(
    title: 'Mustache Hub',
    url: 'https://github.com/igormidev/mustachehub',
    description:
        'Flutter and Firebase SaaS for authoring structured Mustache templates with reusable variables, collections, shareable URLs, and live output generation.',
  ),
];

const _differentiatorBullets = [
  'Flutter since beta, with deep practical knowledge of framework internals, state management tradeoffs, navigation stacks, and first-class deep linking.',
  'Performance-first mindset focused on eliminating jank, reducing overbuild, and shipping polished apps that stay smooth under real usage.',
  'Architecture discipline around package-based monorepos, internal packages, focused test coverage on critical paths, custom lints, analytics, attribution, i18n, offline-first behavior, realtime sync, and backend security constraints.',
];

Future<void> main(List<String> arguments) async {
  final outputPath = arguments.isEmpty
      ? _defaultOutputPath()
      : File(arguments.first).absolute.path;

  final document = pw.Document(
    title: 'Igor Miranda - Senior Dart / Flutter Specialist',
    author: _name,
    creator: 'igorcurriculum',
    subject: 'ATS-friendly Dart-focused resume generated with Dart',
    keywords: [
      'Dart',
      'Flutter',
      'Flutter Web',
      'Serverpod',
      'Supabase',
      'Firebase',
      'Riverpod',
      'BLoC',
      'go_router',
      'PostHog',
      'performance',
      'architecture',
      'resume',
      'curriculum',
    ].join(', '),
    theme: pw.ThemeData.withFont(
      base: pw.Font.helvetica(),
      bold: pw.Font.helveticaBold(),
      italic: pw.Font.helveticaOblique(),
      boldItalic: pw.Font.helveticaBoldOblique(),
    ),
  );

  document.addPage(
    pw.MultiPage(
      // ignore: prefer_const_constructors
      pageTheme: pw.PageTheme(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(34, 32, 34, 28),
      ),
      build: (context) => [
        _buildHeader(),
        _sectionTitle('SUMMARY OF QUALIFICATIONS'),
        ..._summaryBullets.map(_bulletText),
        _sectionTitle('CORE TECHNICAL KEYWORDS'),
        ..._keywordLines.map(_keywordLine),
        _sectionTitle('EXPERIENCE'),
        ..._experienceEntries.map(_experienceBlock),
        _sectionTitle('SELECTED DART AND FLUTTER PACKAGES'),
        ..._packageEntries.map(_linkedEntryBlock),
        _sectionTitle('FOUNDER-BUILT PRODUCTS'),
        ..._productEntries.map(_linkedEntryBlock),
        _sectionTitle('TECHNICAL DIFFERENTIATORS'),
        ..._differentiatorBullets.map(_bulletText),
      ],
    ),
  );

  final outputFile = File(outputPath);
  outputFile.parent.createSync(recursive: true);
  outputFile.writeAsBytesSync(await document.save());

  stdout.writeln('PDF generated at: ${outputFile.path}');
}

String _defaultOutputPath() {
  return File('generated/$_outputFileName').absolute.path;
}

pw.Widget _buildHeader() {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 14),
    padding: const pw.EdgeInsets.only(bottom: 12),
    decoration: const pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(color: PdfColors.blueGrey300, width: 1),
      ),
    ),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          _name.toUpperCase(),
          style: pw.TextStyle(
            fontSize: 23,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blueGrey900,
            letterSpacing: 0.8,
          ),
        ),
        pw.SizedBox(height: 4),
        pw.Text(
          _headline,
          style: pw.TextStyle(
            fontSize: 13.5,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blue700,
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Text(
          _subheadline,
          style: const pw.TextStyle(
            fontSize: 10.6,
            color: PdfColors.blueGrey700,
            lineSpacing: 1.2,
          ),
        ),
        pw.SizedBox(height: 9),
        _contactGroup(_contactLinks.take(3).toList(growable: false)),
        _contactGroup(_contactLinks.skip(3).toList(growable: false)),
      ],
    ),
  );
}

pw.Widget _contactGroup(List<_ContactLink> links) {
  final children = <pw.InlineSpan>[];

  for (final (index, link) in links.indexed) {
    if (index > 0) {
      children.add(const pw.TextSpan(text: ' | '));
    }

    children.add(
      pw.TextSpan(
        text: '${link.label}: ',
        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      ),
    );
    children.add(
      pw.WidgetSpan(
        child: pw.UrlLink(
          destination: link.url,
          child: pw.Text(
            link.text,
            style: _linkStyle,
          ),
        ),
      ),
    );
  }

  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 2),
    child: pw.RichText(
      text: pw.TextSpan(
        style: _bodyStyle,
        children: children,
      ),
    ),
  );
}

pw.Widget _sectionTitle(String text) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(top: 4, bottom: 7),
    padding: const pw.EdgeInsets.only(bottom: 4),
    decoration: const pw.BoxDecoration(
      border: pw.Border(
        bottom: pw.BorderSide(color: PdfColors.grey400, width: 0.6),
      ),
    ),
    child: pw.Text(
      text,
      style: pw.TextStyle(
        fontSize: 11.4,
        fontWeight: pw.FontWeight.bold,
        color: PdfColors.blueGrey900,
        letterSpacing: 0.5,
      ),
    ),
  );
}

pw.Widget _keywordLine(String line) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 3),
    child: pw.Text(
      line,
      style: _bodyStyle,
    ),
  );
}

pw.Widget _bulletText(String text) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 4),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          margin: const pw.EdgeInsets.only(top: 4.2, right: 6),
          width: 4,
          height: 4,
          decoration: const pw.BoxDecoration(
            color: PdfColors.blue700,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.Expanded(
          child: pw.Text(
            text,
            style: _bodyStyle,
          ),
        ),
      ],
    ),
  );
}

pw.Widget _experienceBlock(_ExperienceEntry entry) {
  return pw.Container(
    margin: const pw.EdgeInsets.only(bottom: 8),
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          '${entry.title} | ${entry.companyOrContext}',
          style: pw.TextStyle(
            fontSize: 10.8,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.blueGrey900,
          ),
        ),
        pw.SizedBox(height: 2),
        pw.Text(
          entry.period,
          style: const pw.TextStyle(
            fontSize: 9.6,
            color: PdfColors.grey700,
          ),
        ),
        pw.SizedBox(height: 2),
        _urlLine(
          label: 'Primary link',
          url: entry.link,
        ),
        if (entry.secondaryLink != null) ...[
          pw.SizedBox(height: 1),
          _urlLine(
            label: entry.secondaryLinkLabel ?? 'Additional link',
            url: entry.secondaryLink!,
          ),
        ],
        pw.SizedBox(height: 3),
        ...entry.bullets.map(_bulletText),
      ],
    ),
  );
}

pw.Widget _linkedEntryBlock(_LinkedEntry entry) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 4),
    child: pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Container(
          margin: const pw.EdgeInsets.only(top: 4.2, right: 6),
          width: 4,
          height: 4,
          decoration: const pw.BoxDecoration(
            color: PdfColors.blue700,
            shape: pw.BoxShape.circle,
          ),
        ),
        pw.Expanded(
          child: pw.RichText(
            text: pw.TextSpan(
              style: _bodyStyle,
              children: [
                pw.TextSpan(
                  text: '${entry.title} - ',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.WidgetSpan(
                  child: pw.UrlLink(
                    destination: entry.url,
                    child: pw.Text(
                      entry.url,
                      style: _linkStyle,
                    ),
                  ),
                ),
                pw.TextSpan(text: ' - ${entry.description}'),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

pw.Widget _urlLine({
  required String label,
  required String url,
}) {
  return pw.RichText(
    text: pw.TextSpan(
      style: _bodyStyle.copyWith(fontSize: 9.4),
      children: [
        pw.TextSpan(
          text: '$label: ',
          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
        ),
        pw.WidgetSpan(
          child: pw.UrlLink(
            destination: url,
            child: pw.Text(
              url,
              style: _linkStyle.copyWith(fontSize: 9.4),
            ),
          ),
        ),
      ],
    ),
  );
}

const _bodyStyle = pw.TextStyle(
  fontSize: 9.85,
  color: PdfColors.grey900,
  lineSpacing: 1.2,
);

final _linkStyle = _bodyStyle.copyWith(
  color: PdfColors.blue700,
  decoration: pw.TextDecoration.underline,
);

class _ContactLink {
  final String label;
  final String text;
  final String url;

  const _ContactLink({
    required this.label,
    required this.text,
    required this.url,
  });
}

class _ExperienceEntry {
  final String title;
  final String companyOrContext;
  final String period;
  final String link;
  final String? secondaryLink;
  final String? secondaryLinkLabel;
  final List<String> bullets;

  const _ExperienceEntry({
    required this.title,
    required this.companyOrContext,
    required this.period,
    required this.link,
    this.secondaryLink,
    this.secondaryLinkLabel,
    required this.bullets,
  });
}

class _LinkedEntry {
  final String title;
  final String url;
  final String description;

  const _LinkedEntry({
    required this.title,
    required this.url,
    required this.description,
  });
}
