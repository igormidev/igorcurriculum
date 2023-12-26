import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactGridView extends StatelessWidget {
  const ContactGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            final List<Widget> items = [
              const ContactTile(
                scale: 1.0,
                url: 'https://cdn-icons-png.flaticon.com/512/732/732223.png',
                text: 'Outlook',
                description: 'Text me\nan email',
              ),
              const SizedBox(width: 16),
              const ContactTile(
                scale: 0.9,
                url:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/1200px-GitHub_Invertocat_Logo.svg.png',
                text: 'Github',
                description: 'Check out my\nrepositories',
              ),
              const SizedBox(width: 16),
              const ContactTile(
                scale: 1.5,
                url: 'https://cdn-icons-png.flaticon.com/256/174/174857.png',
                text: 'LinkedIn',
                description: 'Check out my\nprofile',
              ),
              const SizedBox(width: 16),
              const ContactTile(
                scale: 1.3,
                url:
                    // 'https://static-00.iconduck.com/assets.00/whatsapp-icon-2048x2048-rgp6kyqx.png',
                    'https://cdn-icons-png.flaticon.com/512/3670/3670051.png',
                text: 'WhatsApp',
                description: 'Send me a\nmessage',
              )
            ];
            if (constraints.maxWidth <= 350) {
              return const Row();
            } else {
              return Row(
                children: items,
              );
            }
          },
        ),
      ],
    );
  }
}

class ContactTile extends StatelessWidget {
  final double scale;
  final String url;
  final String text;
  final String description;
  const ContactTile({
    super.key,
    required this.scale,
    required this.url,
    required this.text,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ).animate(delay: 800.milliseconds).fadeIn(
                      duration: 400.milliseconds,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              // style: Theme.of(context).textTheme.titleMedium?.copyWith(),
            ),
            Text(
              description,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: Theme.of(context).colorScheme.outline,
                height: 0.9,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
          ],
        ),
      )
          .animate(delay: 300.milliseconds)
          .fade()
          .scale(duration: 200.milliseconds),
    );
  }
}
