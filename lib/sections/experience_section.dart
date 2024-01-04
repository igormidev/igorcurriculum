import 'dart:math';

import 'package:dart_debouncer/dart_debouncer.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:igorcurriculum/shared/shimmer_build_delay_wrapper.dart';
import 'package:image_network/image_network.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBuildDelayWrapper(
          duration: Constants.myExperiencePackagesHeaderDelay,
          height: 30,
          child: SizedBox(
            height: 30,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Experience',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                TextSpan(
                  text: ' • Employment history',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ]),
            ),
          ),
        ),
        const SizedBox(height: 8),
        ShimmerBuildDelayWrapper(
          duration: Constants.myExperienceagesSubtitleDelay,
          height: 26,
          child: SizedBox(
            height: 26,
            child: Text(
              'My relevant experiences working with flutter.',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.outline,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        const ExperienceTile(
          imageUrl:
              'https://pbs.twimg.com/profile_images/1389671445953921029/8D3jABqV_400x400.jpg',
          title:
              '🥇 𝗧𝗢𝗣 𝗥𝗔𝗧𝗘𝗗 𝗙𝗿𝗲𝗲𝗹𝗮𝗻𝗰𝗲𝗿 𝘸𝘪𝘵𝘩 100% 𝘑𝘰𝘣 𝘚𝘶𝘤𝘤𝘦𝘴𝘴 𝘳𝘢𝘵𝘦',
          description:
              '''💡 Within this platform I built strong bonds with clients and helped them deliver a lot of value to their users through my skills.

📈 Meteoric rise
With a lot of struggle and determination, I quickly went from being an amateur freelancer on the site to earning the "talent in accession" badge and recently being awarded the "top rated" freelancer badge. This way, I position myself among the top 5% of freelancers on the site.''',
          workPeriodText: 'march 2023 - present',
        ),
        const SizedBox(height: 8),
        const ExperienceTile(
          imageUrl:
              'https://play-lh.googleusercontent.com/5qePH2BAHlH_t6oo1vGtZkQJ6zHbr5F1hOqZNOuIQHDmXGugIsF583nsMur_fcS7Jzbk=w240-h480-rw',
          title:
              '📈 Flutter Senior in app with more then +𝟓𝟎𝟎 𝐭𝐡𝐨𝐮𝐬𝐚𝐧𝐝 𝐮𝐬𝐞𝐫𝐬',
          description:
              '''⚽️ Football social media that connects users to other users and clubs with partnership for selections

 📈 Success app! More then 500 thousand of downloads.

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
        ),
        const SizedBox(height: 8),
        const ExperienceTile(
          imageUrl:
              'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBhAIBxAVEBIVGRIbGBcVGRsQEBASIB0iIiAdHx8kIDQkJCYxJx8fLTIlMSstOjA3Iys0ODstNzQvLy0BCgoKDg0OGhAQGC8lHx8tLSstLS0rLS0tKystKystLS0tLS0rLS0rNy0tLSstLTc1LS0uLS0tLS0tLTUuNzI3Lf/AABEIAMgAyAMBEQACEQEDEQH/xAAaAAEBAAMBAQAAAAAAAAAAAAAABgQFBwMB/8QAQBAAAgECAgMJDgUEAwAAAAAAAAECAwQFEQYhMQcSQVFTcZGhshMVFiIjMjU2UmFzgcHRFEJig7FyktLwJDNG/8QAGwEBAAMBAQEBAAAAAAAAAAAAAAEFBgQDAgf/xAAuEQEAAQMCBQIFBQADAAAAAAAAAQIDBAUREiExQVETFRQyM1JxIiM1RGEGQoH/2gAMAwEAAhEDEQA/AJM/QnuAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAbkgmduspkI46fKNwcdPk3Bx0+TcHHT5NwTVG25vG24N426oiqJCY3lPUJOoQAAAAAAAAAAAAAAAAAJF1uQQjPSKsppPyMtuv8ANApNbq2op28vmqXXvw9H2I9CM1x1eXnu+9wpeyuhDjq8m53Cl7K6EOOrybncafsroHHPk3cSqyjLdIqbzZ3eouhtGopmYwY/D5yJmLe69qUqdVb2pFSXE1mUEXKo7s/xy1GIaL4Texfk1Tl7VPxOrZ1HXZ1C9R35Oi3mV0onHtGLzCU6sfKUvaS1x51wF5i59F3/ACVrYy6bjRlg6wAAAAAAAAAAAAAAAAJF3uOesdb4Mu3Aotc+nT+XzW7EZl5AADHvbmnZ2lS5rvKMIyk+ZLNn1bo4qopjumHBMBryutKqdxU2zqSk+d5tmwyKODG2/wAfOV9KXUTKs7IB8lGMouMlmnx8JMTMETs51pho+sMq/i7ReSk9a5OXFzGk0/N9WnhnrC7wsr1I4Z6potp8u8IAAAAAAAAAAAAAAAkXe476y1fgz7cCi1z6dP5fNbsRmXkAfCO451usaRRoWiwW2l488nUy/LT2pc7fUveXmj4nFX6s9I6PSmHPNFvWC3/q+heZ8/sy8sr6UurmQnkzsgADwvrSnfWc7Wss4yWXN7z1s3Jt1xVS9LVyaK4mnq5BdUJ2tzO3q+dFtPnTNlariuiKoaO3VxUPI+32AAAAAAAAAAAAAACRdbjvrJV+DPtwKPXPp0/l81OxGYeQBH6Z6b2mBU5W1m1VuPZWuNL3y/x/gs8HTq79W9XKl9xS4xdXNa8uZXFzJznJtyb2tmtt26aKeCno9Gfov6wW/wDUc+fH7Ey58v6MurmQ5yzu07A5AAEdRzPTigqOkE5L88YS6svoanTKt7UL7Bq/baAsXYAAAAAAAAAAAAAAE9Y3JUWgukFvo5i07y6hKcZU5Qyhlnm5RfC/cVupYlWTREU9kTCzud1i1Uf+Lazk/wBUlBdWZVUaJXPzVbPngSuN7oGOYpF06clbwfBTzUmvfLb0ZFjj6TYt86uaeFKNtvNlpERTyh9QE7Qll4RdxsMSp3U02oPPJbWeGRam5RNMS8r1vjomIW1PTrD2/KU6i/tf1KSrSa46SqatPr7NnZaS4TetRp1VF8U/E/nUcl3AvUdYeFeJdo7NutazRxzE08pc0xMdQg7Od7oXpuHw49qRpdK+mutP+mmC1WAAAAAAAAAAAAAAAT/g2mjtrQvL2VO5jvlvW9rWvNcRR63lXcexvbnaXbhWqLlW1Si7x4byXXL7mP8Afc771t8DZ8HePDeS65fce+533nwVnwd48N5JdMvuPfM77z4Kz4O8mG8kumX3Ea5nb/OfBWfCcVrR8IPw298Tf5Za9hr5y7saf6u/6lT6dMZHBtyUMsCw6S/68uaT+5k413Npn51rODY6bMG60Yg1naTafFLWuks8X/k077Xqd3Nd02J50MayxXFtHaypVM3D2Ja4NfpfB8i8pnFz6eKieaiy8DtVC+wbF7XF7buts9a86L86D/3hKfIxa7NW0x/6z96xXb5IvdC9Nw+FHtSLvSedG8rXT/kTBbO8AAAAAAAAAAAAAAEbRHI/DZaO1lRxWGf5s107OvIpddsceLVPd2YNUUXo3Wp+bbNEDYAcgmOqJ2SK9af3Dez/ABCj/tK4wU7r3uEcpRO27yubeldUXSrrNM6cbKuY9XFbl8XbdNyNphLTjd6N4nGvbPNcHFOPDFm+wsy3qNnhn5maz8KYiaZ6dnpphfUsSvaN1Q2SpR1cMXvpZpnZgWZtUzRPZX4tubccMtEWDrAAAAAAAAAAAAAAB3JfYScJqcHk080+JnxetxXTMPqmrad17h13C+tI14/NcUuFH5dqGJXj35p7NLYvcdO8Mk4O7325gAmOqJSP/qf3Dex/EqP+0rjBSvI6BCQDFxKzjfWcqMtu1PilwFhpuZONfiqOjwyLXqUTSg5xcJOMtTWrmP1C3XTXEVU92Zqp2q2fD0QEAAAAAAAAAAAAAAnqBG0mzPwfE54dXzeuD85fVe8qNW0yMuidvmjo68XJm1V/i0t69O5pKrRaknxH53fxrliZorjmv6LkVxvD0Od6BMdUSkX60/uG9j+JUf8AaVxgpXkdAhIAG/g7orSGiqOKzy2Syl07evM/StCvTcxKfMM5m0cN2Za0uXIAAAAAAAAAAAAAAAAA6nVkWV9cWVTf28suNbYvnRxZmBZyadq4e9nIrt9FBa6TUZLK6g4vjj40TKZf/Grkc7c7rO3qNP8A2hnwxrDpLNVV8019CrnRM2J+R0/HWZ7px3NHwh/Eb5bzf558GRroxrnt3pbfqVXqU/EcW6k78YdysesyE6Nl7z+hbRl2tup34w7lV1key5n2Hxlnyd+cO5VdY9lzPsPjLPk784dyq6yY0XM+w+Msz0lN6R3NC6vo1LeSkt6lmuPNmx0LGuY9ngrhU5tyK6t4lqy8cIAAAAAAAAAAAAAAAAE9zfwEbzunnASj8hCd/DKwu1V9iNO1k96pySzW1HjfucFE1R2eV2vgp4ll4BW3Lz6EUnvFX2qz3GrweAdry8+hD3eftPcqvB4B2vLT6EPd5+09yq8HgHacvPoQ93n7T3GfCa0mwing19G3pSc04KWb1cLX0LXByZvU77O7GvTdp3lqDsdIAAAAAAAAAAAAAAAAAAAADKwmurbE6NeWyM4N82es8cijitVQ8r1O9Mw7CYyY5zDNzPUIQAAhz3dE9M0/hR7UjSaT9OV3p/yJYtlgAAAAAAAAAAAAAAAAAAAAACY35I7OqaLYksSweE285xW9lx75cPzWsyWfY9K5MKDLtenW25xOUABDnu6J6Zp/Dj2pGk0n6crvT/kSxbLAAAAAAAAAAAAAAAAAAAAAAJ7HdtdHcZqYNfd11uEtU48a4170cWZjevQ5smx6sOo2tzRu7eNxbSUovWmjK3bddudpUFdFVM7S9Tz6PnnAOpMOe7onpin8NdqRpNJ5W5XWB8qWLZYAAAAAAAAAAAAAAAAAAAAABPQkIT0bHBsbvMHq762ecXtg9cJfZ+85cjDovRzc97HpuRtMLnDdMMMvIpV33GXFLzflL75FDe027RPLnCpuYNyjp0byjc0K6zoTjNfpal/BwzZqp7OWq1VCC3RPTFP4a7UjQaTH7c7rjA5U80sWzvAAAAAAAAAAAAAAAAAAAAAAAAAAI4Y8I2jwExER0TsAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB/9k=',
          title:
              '𝙁𝙡𝙪𝙩𝙩𝙚𝙧 𝙎𝙚𝙣𝙞𝙤𝙧 with crusial participation in video streaming\nfeature on health app',
          description:
              '''⚕️Health plan organization tool with integration with health plan networks.

🏥 In this season freelance task-demand work I contributed to the delivery of tasks involving health insurance. 

📹 Also, I implemented video/chat with health providers features.''',
          workPeriodText: 'april 2023 - dezember 2023',
        ),
        const SizedBox(height: 8),
        const ExperienceTile(
          imageUrl:
              'data:image/jpeg;base64,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',
          title: '𝗧𝗲𝗰𝗵 𝗹𝗲𝗮𝗱 𝗂𝗇 𝖺 𝗕𝗮𝗻𝗸 𝖺𝗉𝗉',
          description: '''🏦 The truck drivers' bench.

🧱 In this bank company I designed the application architecture. Thinking about an easy to maintain, modify and scale project structure. 

💪 With that strong code base, me and my team delivered high value to the final by producing apps that not only look great, but also runs smoothly, without bugs.''',
          workPeriodText: 'february 2022 - april 2023 (1 year 3 months)',
        ),
        const SizedBox(height: 8),
        const ExperienceTile(
          imageUrl:
              'https://is1-ssl.mzstatic.com/image/thumb/Purple116/v4/75/97/6d/75976dfd-eddb-0ec1-e737-728f90cdeb88/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/512x512bb.jpg',
          title:
              '𝗧𝗲𝗰𝗵 𝗹𝗲𝗮𝗱 𝗂𝗇 𝖿𝗅𝖾𝖾𝗍 𝖺𝖼𝖼𝗈𝗎𝗇𝗍/𝗆𝖺𝗇𝖺𝗀𝖾𝗋 𝖺𝗉𝗉',
          description: '''⛽️ A app for payment in accredited gas stations.

👥 Together with the team, we developed a banking payment solution for Target Bank's accredited gas stations.

💪 With a strong code base, me and my team delivered high value to the final by producing apps that not only look great, but also runs smoothly, without bugs.''',
          workPeriodText: 'february 2022 - april 2023 (1 year 3 months)',
        ),
      ],
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String workPeriodText;
  const ExperienceTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.workPeriodText,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerBuildDelayWrapper(
      duration: Constants.experienceCardDelay +
          (Random().nextInt(5) * 1200).milliseconds,
      height: 220,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant.withAlpha(100),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageNetwork(
              image: imageUrl,
              height: 64,
              width: 64,
              fitWeb: BoxFitWeb.cover,
              onLoading: const CircularProgressIndicator.adaptive(),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  // const SizedBox(height: 8),
                  Text(
                    workPeriodText,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .outline
                              .withAlpha(190),
                        ),
                  ),
                  const SizedBox(height: 8),
                  SelectableText(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
