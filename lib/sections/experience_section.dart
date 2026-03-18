import 'package:flutter/material.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';
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
            '🥇 𝗧𝗢𝗣 𝗥𝗔𝗧𝗘𝗗 𝗙𝗿𝗲𝗲𝗹𝗮𝗻𝗰𝗲𝗿 𝘸𝘪𝘵𝘩 100% 𝘑𝘰𝘣 𝘚𝘶𝘤𝘤𝘦𝘴𝘴 𝘳𝘢𝘵𝘦',
        description:
            '''💡 Within this platform I built strong bonds with clients and helped them deliver a lot of value to their users through my skills.

📈 Meteoric rise
With a lot of struggle and determination, I quickly went from being an amateur freelancer on the site to earning the "talent in accession" badge and recently being awarded the "top rated" freelancer badge. This way, I position myself among the top 5% of freelancers on the site.''',
        workPeriodText: 'march 2023 - present',
        link: 'https://www.upwork.com/freelancers/igormidev',
        cacheHeight: 128,
        cacheWidth: 128,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'dsf.JPEG',
        title:
            '📈 Flutter Senior in app with more then +8𝟎𝟎 𝐭𝐡𝐨𝐮𝐬𝐚𝐧𝐝 𝐮𝐬𝐞𝐫𝐬',
        description:
            '''⚽️ Football social media that connects users to other users and clubs with partnership for selections

 📈 Success app! More then 800 thousand of downloads.

In this application, among other things, I've done:
 • 𝗕𝗿𝗮𝘇𝗶𝗹𝗶𝗮𝗻 𝗽𝗶𝘅 𝗽𝗮𝘆𝗺𝗲𝗻𝘁 𝗶𝗻𝘁𝗲𝗴𝗿𝗮𝘁𝗶𝗼𝗻
 • 𝗣𝗲𝗿𝗳𝗼𝗺𝗮𝗻𝗰𝗲 𝗶𝗺𝗽𝗿𝗼𝘃𝗲𝗺𝗲𝗻𝘁 𝗶𝗻 𝗳𝗲𝗲𝗱 𝗽𝗮𝗴𝗲
 • 𝗤𝘂𝗲𝗿𝘆 𝗳𝗼𝗿 𝗰𝗹𝘂𝗯 𝘀𝗲𝗹𝗲𝗰𝘁𝗶𝗼𝗻 𝗰𝗿𝗲𝗮𝘁𝗲𝗱
 • 𝗨𝘀𝗲𝗿 𝗽𝗼𝘀𝘁 𝗰𝗼𝗺𝗽𝗹𝗲𝘁𝗲 𝗨𝗜/𝗨𝗫 𝗿𝗲𝗳𝗮𝗰𝘁𝗼𝗿
 • 𝗜𝗻 𝗮𝗽𝗽 𝗯𝗮𝗻𝗻𝗲𝗿 𝗶𝗺𝗽𝗹𝗲𝗺𝗲𝗻𝘁𝗮𝘁𝗶𝗼𝗻
 • 𝗨𝘀𝗲𝗿 𝗶𝗻 𝗮𝗽𝗽 𝗿𝗮𝗻𝗸/𝗯𝗮𝗱𝗴𝗲 𝘀𝘆𝘀𝘁𝗲𝗺 𝗶𝗺𝗽𝗹𝗲𝗺𝗲𝗻𝘁𝗮𝘁𝗶𝗼𝗻
 • 𝗖𝗿𝗼𝘄𝗱𝗳𝘂𝗻𝗱𝗶𝗻𝗴 𝘁𝗵𝗮𝘁 𝗶𝘀 𝗮𝘃𝗮𝗶𝗹𝗮𝗯𝗹𝗲 𝗶𝗻 𝗮𝗽𝗽 𝗮𝗻𝗱 𝗶𝗻 𝘄𝗲𝗯
 • 𝗬𝗼𝘂𝘁𝘂𝗯𝗲 𝘀𝗵𝗼𝗿𝘁𝘀 𝗼𝗳 𝗰𝗹𝘂𝗯𝘀 𝗰𝗵𝗮𝗻𝗻𝗲𝗹 𝗶𝗻𝘁𝗲𝗴𝗿𝗮𝘁𝗶𝗼𝗻

 𝘐𝘯𝘤𝘭𝘶𝘴𝘪𝘷𝘦 𝘐 𝘤𝘳𝘦𝘢𝘵𝘦𝘥 𝘢 𝘱𝘢𝘤𝘬𝘢𝘨𝘦 𝘵𝘰 𝘦𝘯𝘤𝘢𝘱𝘴𝘶𝘭𝘦 𝘵𝘩𝘪𝘴 𝘭𝘰𝘨𝘪𝘤:
 𝘩𝘵𝘵𝘱𝘴://𝘱𝘶𝘣.𝘥𝘦𝘷/𝘱𝘢𝘤𝘬𝘢𝘨𝘦𝘴/𝘺𝘰𝘶𝘵𝘶𝘣𝘦_𝘴𝘩𝘰𝘳𝘵𝘴''',
        workPeriodText: 'april 2023 - present',
        link:
            'https://play.google.com/store/apps/details?id=dreamstock.com.dreamstock&hl=pt_BR&gl=US',
        cacheHeight: 128,
        cacheWidth: 128,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'alinea.jpeg',
        title:
            '𝙁𝙡𝙪𝙩𝙩𝙚𝙧 𝙎𝙚𝙣𝙞𝙤𝙧 with crusial participation in video streaming\nfeature on health app',
        description:
            '''⚕️Health plan organization tool with integration with health plan networks.

🏥 In this season freelance task-demand work I contributed to the delivery of tasks involving health insurance. 

📹 Also, I implemented video/chat with health providers features.''',
        workPeriodText: 'april 2023 - dezember 2023',
        link:
            'https://play.google.com/store/apps/details?id=br.com.alineahealth.app&hl=pt&gl=US',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'targetbank.jpeg',
        title: '𝗧𝗲𝗰𝗵 𝗹𝗲𝗮𝗱 𝗂𝗇 𝖺 𝗕𝗮𝗻𝗸 𝖺𝗉𝗉',
        description: '''🏦 The truck drivers' bench.

🧱 In this bank company I designed the application architecture. Thinking about an easy to maintain, modify and scale project structure. 

💪 With that strong code base, me and my team delivered high value to the final by producing apps that not only look great, but also runs smoothly, without bugs.''',
        workPeriodText: 'february 2022 - april 2023 (1 year 3 months)',
        link:
            'https://apps.apple.com/br/app/target-conta-digital/id1590916424?l=en',
        cacheHeight: 200,
        cacheWidth: 200,
      ),
      const SizedBox(height: 8),
      const ExperienceTile(
        imageUrl: 'targetfleetaccount.jpeg',
        title:
            '𝗧𝗲𝗰𝗵 𝗹𝗲𝗮𝗱 𝗂𝗇 𝖿𝗅𝖾𝖾𝗍 𝖺𝖼𝖼𝗈𝗎𝗇𝗍/𝗆𝖺𝗇𝖺𝗀𝖾𝗋 𝖺𝗉𝗉',
        description: '''⛽️ A app for payment in accredited gas stations.

👥 Together with the team, we developed a banking payment solution for Target Bank's accredited gas stations.

💪 With a strong code base, me and my team delivered high value to the final by producing apps that not only look great, but also runs smoothly, without bugs.''',
        workPeriodText: 'february 2022 - april 2023 (1 year 3 months)',
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
  final int cacheWidth;
  final int cacheHeight;

  const ExperienceTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.workPeriodText,
    required this.link,
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

          final titleBlock = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
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
                SelectableText(description),
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
                          SelectableText(description),
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
