import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/project_showcase_card.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';

const saasAttemptsSectionData = CurriculumSectionData(
  id: 'saas-attempts',
  title: 'SaaS attempts',
  tabLabel: 'Saas Attempts',
  subtitle: 'Finished products',
  description:
      'I tried to create several SaaS products in the past. I only finished and published two of them. These are real, dense products that ran in production and are now open sourced as curriculum projects.',
  buildChildren: _buildSaasAttemptsSectionChildren,
);

List<Widget> _buildSaasAttemptsSectionChildren(BuildContext context) => [
      const ProjectShowcaseCard(
        title: ' 🚀 SaaS - ZenScrap  ',
        titleLinkUrl: 'https://github.com/igormidev/zenscrap',
        onTitleTap: _logOpenedZenScrapRepository,
        shortDescription:
            '''💡 <zenScrap><b>My SaaS ZenScrap<b><zenScrap> is an AI-assisted web scraping product that takes a target URL and a plain-language extraction request, then turns it into a <sC>tested scraper<sC> and <sC>reusable API<sC>.

Its core pitch was not just creating scrapers quickly, but <soft>keeping them alive<soft> by monitoring failures and repairing broken extraction rules automatically.  ''',
        description:
            '''💡 <zenScrap>ZenScrap<zenScrap> was built as a <b>production-oriented scraper platform<b>, not just a one-shot scraper generator.

The workflow was intentionally simple:
 ⦿ Paste a target URL
 ⦿ Describe the data you want in <b>natural language<b>
 ⦿ Let the platform generate a <sC>request contract<sC> and <sC>tested extraction logic<sC>
 ⦿ Expose the result as a callable API endpoint
 ⦿ Keep observing failures and <b>auto-fix<b> the scraper when the target site changes

Under the hood, it was a larger multi-service Dart system with a <serverpod><b>Serverpod backend<b><serverpod>, a <flutter>Flutter client<flutter>, AI orchestration, <scrapingBee>ScrapingBee<scrapingBee> execution, analytics, billing flows and a <sC>self-healing loop<sC> as the main differentiator.''',
        linkTags: {
          '<zenScrap>': 'https://www.zenscrap.com/',
          '<serverpod>': 'https://docs.serverpod.dev/',
          '<flutter>': 'https://docs.flutter.dev/',
          '<scrapingBee>': 'https://www.scrapingbee.com/',
        },
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
            '''💡 A template-authoring SaaS for building <mustache><b>structured Mustache templates<b><mustache> with reusable variables, saved collections, shareable URLs and generated final text.

It was designed for a <soft>pre-LLM workflow<soft> where you define the schema once, save the template online, and later fill a generated form to produce polished text on demand.  ''',
        description:
            '''💡 Mustache Hub was a complete <flutter><b>Flutter<b><flutter> + <firebase><b>Firebase<b><firebase> product for creating, hosting and filling <mustache><sC>logic-less text templates<sC><mustache>.

The product covered the full workflow:
 ⦿ Define text, choice, boolean and nested model variables
 ⦿ Write Mustache-powered text sections against that schema
 ⦿ Save templates online and organize them in a <b>personal collection<b>
 ⦿ Reopen them later from the dashboard or by <sC>shareable URL<sC>
 ⦿ Fill the generated form and get the final rendered output immediately

It also included authentication, collection management, profile/account features, responsive dashboard flows and a <soft>custom editor-oriented architecture<soft> around template metadata and live generation.''',
        linkTags: {
          '<mustache>': 'https://mustache.github.io/mustache.5.html',
          '<flutter>': 'https://docs.flutter.dev/',
          '<firebase>': 'https://firebase.google.com/',
        },
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
            child: BabelSelectableText(
              '<b>Archived product:<b> Mustache Hub is no longer actively '
              'maintained and is kept online as a <soft>portfolio archive<soft>.',
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
