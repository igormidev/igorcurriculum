import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactGridView extends StatelessWidget {
  const ContactGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final List<Widget> items = [
            const ContactTile(
              scale: 1.0,
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/732/732223.png',
              text: 'Outlook',
              description: 'Text me\nan email',
              url: 'mailto:igor9ms@outlook.com',
            ),
            const SizedBox(width: 4),
            const ContactTile(
              scale: 0.9,
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/1200px-GitHub_Invertocat_Logo.svg.png',
              text: 'Github',
              description: 'Check out my\nrepositories',
              url: 'https://github.com/igormidev',
            ),
            const SizedBox(width: 4),
            const ContactTile(
              scale: 1.5,
              imageUrl: 'https://cdn-icons-png.flaticon.com/256/174/174857.png',
              text: 'LinkedIn',
              description: 'Check out my\nprofile',
              url: 'https://www.linkedin.com/in/igor-midev/',
            ),
            const SizedBox(width: 4),
            const ContactTile(
              scale: 1.3,
              imageUrl:
                  'https://cdn-icons-png.flaticon.com/512/3670/3670051.png',
              text: 'WhatsApp',
              description: 'Send me a\nmessage\n+55 (21) 9 6710-3488',
              url: 'https://wa.me/5521967103488',
            )
          ];
          if (constraints.maxWidth <= 350) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: items,
            );
          } else {
            return const Column(
              children: [
                Row(
                  children: [
                    ContactTile(
                      scale: 1.0,
                      imageUrl:
                          'https://cdn-icons-png.flaticon.com/512/732/732223.png',
                      text: 'Outlook',
                      description: 'Text me an email\nigor-devwork@outlook.com',
                      url: 'mailto:igor-devwork@outlook.com',
                    ),
                    SizedBox(width: 16),
                    ContactTile(
                      scale: 0.9,
                      imageUrl:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/1200px-GitHub_Invertocat_Logo.svg.png',
                      text: 'Github',
                      description:
                          'Check out my repositories\nhttps://github.com/igormidev',
                      url: 'https://github.com/igormidev',
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    ContactTile(
                      scale: 1.5,
                      imageUrl:
                          'https://cdn-icons-png.flaticon.com/256/174/174857.png',
                      text: 'LinkedIn',
                      description:
                          'Check out my profile\nlinkedin.com/in/igor-midev',
                      url: 'https://www.linkedin.com/in/igor-midev/',
                    ),
                    SizedBox(width: 16),
                    ContactTile(
                      scale: 1.3,
                      imageUrl:
                          'https://cdn-icons-png.flaticon.com/512/3670/3670051.png',
                      text: 'WhatsApp',
                      description: 'Send me a message\n+55 (21) 9 6710-3488',
                      url: 'https://wa.me/5521967103488',
                    ),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final double scale;
  final String imageUrl;
  final String text;
  final String description;
  final String url;
  const ContactTile({
    super.key,
    required this.scale,
    required this.imageUrl,
    required this.text,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          launchUrl(Uri.parse(url));
          AnalyticsService.instance.logContact(text.toLowerCase());
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ).animate(delay: 800.milliseconds).fadeIn(
                            duration: 400.milliseconds,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        // style: Theme.of(context).textTheme.titleMedium?.copyWith(),
                      ),
                      SelectableText(
                        description,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w300,
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.outline,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(Icons.open_in_new),
                ),
              ),
            ],
          ),
        )
            .animate(delay: 300.milliseconds)
            .fade()
            .scale(duration: 200.milliseconds),
      ),
    );
  }
}
