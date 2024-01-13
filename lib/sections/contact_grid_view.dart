import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:url_launcher/url_launcher.dart';

final contactGridView = [
  const Row(
    children: [
      ContactTile(
        scale: 1.0,
        imagePath: 'outlook.png',
        text: 'Outlook',
        description: 'Text me an email\nigor-devwork@outlook.com',
        url: 'mailto:igor-devwork@outlook.com',
        cacheHeight: 100,
        cacheWidth: 100,
      ),
      SizedBox(width: 16),
      ContactTile(
        scale: 0.9,
        imagePath: 'github.PNG',
        text: 'Github',
        description: 'Check out my repositories\nhttps://github.com/igormidev',
        url: 'https://github.com/igormidev',
        cacheHeight: 100,
        cacheWidth: 100,
      ),
    ],
  ),
  const SizedBox(height: 8),
  const Row(
    children: [
      ContactTile(
        scale: 1.5,
        imagePath: 'linkedin.png',
        text: 'LinkedIn',
        description: 'Check out my profile\nlinkedin.com/in/igor-midev',
        url: 'https://www.linkedin.com/in/igor-midev/',
        cacheHeight: 100,
        cacheWidth: 100,
      ),
      SizedBox(width: 16),
      ContactTile(
        scale: 1.3,
        imagePath: 'whatsapp.PNG',
        text: 'WhatsApp',
        description: 'Send me a message\n+55 (21) 9 6710-3488',
        url: 'https://wa.me/5521967103488',
        cacheHeight: 100,
        cacheWidth: 100,
      ),
    ],
  ),
];

class ContactTile extends StatelessWidget {
  final double scale;
  final String imagePath;
  final String text;
  final String description;
  final String url;
  final int cacheWidth;
  final int cacheHeight;

  const ContactTile({
    super.key,
    required this.scale,
    required this.imagePath,
    required this.text,
    required this.description,
    required this.url,
    required this.cacheWidth,
    required this.cacheHeight,
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
                        child: OptimizedAsset(
                          assetName: 'art/tumbnails/contacts/$imagePath',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                          cacheWidth: cacheWidth,
                          cacheHeight: cacheHeight,
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
