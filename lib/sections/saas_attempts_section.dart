import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/project_showcase_card.dart';

List<Widget> saasAttemptsSection(BuildContext context) => [
      SizedBox(
        height: 30,
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'SaaS attempts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            TextSpan(
              text: ' • Finished products',
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
      Text(
        'I tried to create several SaaS products in the past. I only finished and published two of them, and they are the ones below. These are real, dense, complex, 100% complete products that ran in production. They did not return the profit I wanted, so I open sourced them as curriculum projects.',
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Theme.of(context).colorScheme.outline,
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: ' 🚀 SaaS - ZenScrap  ',
        titleLinkUrl: 'https://github.com/igormidev/zenscrap',
        onTitleTap: _logOpenedZenScrapRepository,
        shortDescription:
            '''💡 An AI-assisted web scraping SaaS that takes a target URL and a plain-language extraction request, then turns it into a tested scraper and reusable API.

Its core pitch was not just creating scrapers quickly, but keeping them alive by monitoring failures and repairing broken extraction rules automatically.  ''',
        description:
            '''💡 ZenScrap was built as a production-oriented scraper platform, not just a one-shot scraper generator.

The workflow was intentionally simple:
 ⦿ Paste a target URL
 ⦿ Describe the data you want in natural language
 ⦿ Let the platform generate a request contract and tested extraction logic
 ⦿ Expose the result as a callable API endpoint
 ⦿ Keep observing failures and auto-fix the scraper when the target site changes

Under the hood, it was a larger multi-service Dart system with a Serverpod backend, a Flutter client, AI orchestration, ScrapingBee execution, analytics, billing flows and a self-healing loop as the main differentiator.''',
        imageAssetName: 'art/tumbnails/saas/zenscrap.png',
        size: Size(190, 120),
        fit: BoxFit.contain,
        stackImageOnNarrowWidth: true,
        actions: [
          ProjectShowcaseAction(
            label: 'Visit the SaaS website',
            url: 'https://www.zenscrap.com/',
            onTap: _logOpenedZenScrapWebsite,
          ),
          ProjectShowcaseAction(
            label: 'Open the GitHub codebase',
            url: 'https://github.com/igormidev/zenscrap',
            onTap: _logOpenedZenScrapRepository,
          ),
        ],
        cacheHeight: 360,
        cacheWidth: 560,
      ),
      const SizedBox(height: 8),
      const ProjectShowcaseCard(
        title: ' 🚀 SaaS - Mustache Hub  ',
        titleLinkUrl: 'https://github.com/igormidev/mustachehub',
        onTitleTap: _logOpenedMustacheHubRepository,
        shortDescription:
            '''💡 A template-authoring SaaS for building structured Mustache templates with reusable variables, saved collections, shareable URLs and generated final text.

It was designed for a pre-LLM workflow where you define the schema once, save the template online, and later fill a generated form to produce polished text on demand.  ''',
        description:
            '''💡 Mustache Hub was a complete Flutter + Firebase product for creating, hosting and filling logic-less text templates.

The product covered the full workflow:
 ⦿ Define text, choice, boolean and nested model variables
 ⦿ Write Mustache-powered text sections against that schema
 ⦿ Save templates online and organize them in a personal collection
 ⦿ Reopen them later from the dashboard or by shareable URL
 ⦿ Fill the generated form and get the final rendered output immediately

It also included authentication, collection management, profile/account features, responsive dashboard flows and a custom editor-oriented architecture around template metadata and live generation.''',
        expandedFooter: _ArchivedSaasNotice(),
        imageAssetName: 'art/tumbnails/saas/mustache_hub.png',
        size: Size(190, 120),
        fit: BoxFit.contain,
        stackImageOnNarrowWidth: true,
        actions: [
          ProjectShowcaseAction(
            label: 'Visit the SaaS website',
            url: 'https://mustachehub.com/',
            onTap: _logOpenedMustacheHubWebsite,
          ),
          ProjectShowcaseAction(
            label: 'Open the GitHub codebase',
            url: 'https://github.com/igormidev/mustachehub',
            onTap: _logOpenedMustacheHubRepository,
          ),
        ],
        cacheHeight: 360,
        cacheWidth: 560,
      ),
    ];

class _ArchivedSaasNotice extends StatelessWidget {
  const _ArchivedSaasNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 18,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Archived product: Mustache Hub is no longer actively maintained and is kept online as a portfolio archive.',
              style: TextStyle(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onErrorContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _logOpenedZenScrapWebsite() =>
    AnalyticsService.instance.logOpenedSaasWebsite('zenscrap');
void _logOpenedZenScrapRepository() =>
    AnalyticsService.instance.logOpenedSaasRepository('zenscrap');
void _logOpenedMustacheHubWebsite() =>
    AnalyticsService.instance.logOpenedSaasWebsite('mustache_hub');
void _logOpenedMustacheHubRepository() =>
    AnalyticsService.instance.logOpenedSaasRepository('mustache_hub');
