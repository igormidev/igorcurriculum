import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/shared/babel_text_utils.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:url_launcher/url_launcher.dart';

const experienceSectionData = CurriculumSectionData(
  id: 'experience',
  title: 'Experience',
  tabLabel: 'Experience',
  subtitle: 'Employment history',
  description:
      'My strongest professional work shipping Flutter products in production, from senior delivery to technical leadership.',
  buildChildren: _buildExperienceSectionChildren,
);

List<Widget> _buildExperienceSectionChildren(BuildContext context) => [
      const ExperienceTile(
        imageUrl: 'upwork.jpeg',
        title:
            '<b>TOP RATED<b> Freelancer <soft>with<soft> <sC><b>100% Job Success rate<b><sC>',
        description:
            '''On this platform I built strong bonds with clients and helped them deliver real value to their users through my work.

<pC><b>Meteoric rise<b><pC>
With a lot of struggle and determination, I quickly went from being an amateur freelancer on the site to earning the <b>"talent in accession"<b> badge and later the <b>"top rated"<b> freelancer badge. This positioned me among the <sC>top 5% of freelancers<sC> on the platform.''',
        workPeriodText: 'March 2023 - present',
        link: 'https://www.upwork.com/freelancers/igormidev',
        cacheHeight: 128,
        cacheWidth: 128,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'dsf.JPEG',
        title:
            'Flutter Senior on an app with <b><sC>800 thousand users<sC><b>',
        description:
            '''Football social media that connects users with other users and clubs through selection partnerships.

<pC><b>Success app<b><pC> with more than <b>800 thousand downloads<b>.

In this application, among other things, I delivered:
 - <b>Brazilian Pix payment integration<b>
 - <b>Feed performance improvements<b>
 - <b>Club selection queries<b>
 - <b>Complete UI/UX refactor for user posts<b>
 - <b>In-app banner implementation<b>
 - <b>User rank / badge system<b>
 - <b>Crowdfunding across app and web<b>
 - <b>YouTube Shorts channel integration<b>

<soft>I even created the<soft> <youtubeShorts>youtube_shorts<youtubeShorts> <soft>package to encapsulate this logic.<soft>''',
        workPeriodText: 'April 2023 - present',
        link:
            'https://play.google.com/store/apps/details?id=dreamstock.com.dreamstock&hl=pt_BR&gl=US',
        linkTags: {
          '<youtubeShorts>': 'https://pub.dev/packages/youtube_shorts',
        },
        cacheHeight: 128,
        cacheWidth: 128,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'alinea.jpeg',
        title:
            'Flutter Senior <soft>with crucial participation in a video streaming feature<soft>\non a health app',
        description:
            '''Health plan organization tool with integration across health plan networks.

In this freelance season of task-demand work, I contributed to deliveries involving health insurance.

I also implemented <b>video and chat features with health providers<b>.''',
        workPeriodText: 'April 2023 - December 2023',
        link:
            'https://play.google.com/store/apps/details?id=br.com.alineahealth.app&hl=pt&gl=US',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'targetbank.jpeg',
        title: '<b>Tech lead<b> <soft>in a<soft> <sC>bank app<sC>',
        description: '''A digital bank for truck drivers.

In this bank company I designed the application architecture around a codebase that was easy to <u>maintain<u>, <u>modify<u> and <u>scale<u>.

With that strong codebase, my team and I delivered high value by shipping apps that not only looked great, but also ran smoothly without bugs.''',
        workPeriodText: 'February 2022 - April 2023 (1 year 3 months)',
        link:
            'https://apps.apple.com/br/app/target-conta-digital/id1590916424?l=en',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'targetfleetaccount.jpeg',
        title:
            '<b>Tech lead<b> <soft>in a<soft> <sC>fleet account / manager app<sC>',
        description: '''A payment app for accredited gas stations.

Together with the team, we developed a banking payment solution for Target Bank's accredited gas stations.

With a strong codebase, my team and I delivered high value by shipping apps that not only looked great, but also ran smoothly without bugs.''',
        workPeriodText: 'February 2022 - April 2023 (1 year 3 months)',
        link:
            'https://play.google.com/store/apps/details?id=br.com.targetmp.cartaofrota&hl=pt_BR&gl=US',
        cacheHeight: 128,
        cacheWidth: 128,
      ),
    ];

class ExperienceTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String workPeriodText;
  final String link;
  final Map<String, String> linkTags;
  final int cacheWidth;
  final int cacheHeight;

  const ExperienceTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.workPeriodText,
    required this.link,
    this.linkTags = const {},
    required this.cacheWidth,
    required this.cacheHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final shouldStack = constraints.maxWidth < 470;

          final image = OptimizedAsset(
            assetName: 'art/tumbnails/work/$imageUrl',
            height: 64,
            width: 64,
            fit: BoxFit.cover,
            cacheWidth: cacheWidth,
            cacheHeight: cacheHeight,
          );

          final descriptionText = BabelSelectableText(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.45,
                ),
            styleMapping: {
              ...buildLinkTextStyleMapping(linkTags.keys),
            },
            onTapMapping: buildUrlTapMapping(linkTags),
            onHoverTooltipMapping: buildLinkTooltipMapping(linkTags.keys),
          );

          final titleBlock = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BabelSelectableText(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                workPeriodText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color:
                          Theme.of(context).colorScheme.outline.withAlpha(190),
                    ),
              ),
            ],
          );

          final openButton = IconButton(
            onPressed: () {
              launchUrl(Uri.parse(link));
            },
            icon: const Icon(Icons.open_in_browser_rounded),
          );

          if (shouldStack) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    image,
                    const SizedBox(width: 10),
                    Expanded(child: titleBlock),
                    openButton,
                  ],
                ),
                const SizedBox(height: 10),
                descriptionText,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image,
              const SizedBox(width: 8),
              Expanded(
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 44),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          titleBlock,
                          const SizedBox(height: 8),
                          descriptionText,
                        ],
                      ),
                    ),
                    openButton,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
