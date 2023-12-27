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
                imageUrl:
                    'https://cdn-icons-png.flaticon.com/512/732/732223.png',
                text: 'Outlook',
                description: 'Text me\nan email',
                url: 'mailto:igor9ms@outlook.com',
              ),
              const SizedBox(width: 16),
              const ContactTile(
                scale: 0.9,
                imageUrl:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/1200px-GitHub_Invertocat_Logo.svg.png',
                text: 'Github',
                description: 'Check out my\nrepositories',
                url: 'https://github.com/igormidev',
              ),
              const SizedBox(width: 16),
              const ContactTile(
                scale: 1.5,
                imageUrl:
                    'https://cdn-icons-png.flaticon.com/256/174/174857.png',
                text: 'LinkedIn',
                description: 'Check out my\nprofile',
                url: 'https://www.linkedin.com/in/igor-midev/',
              ),
              const SizedBox(width: 16),
              const ContactTile(
                scale: 1.3,
                imageUrl:
                    'https://cdn-icons-png.flaticon.com/512/3670/3670051.png',
                text: 'WhatsApp',
                description: 'Send me a\nmessage',
                url: 'https://wa.me/5521967103488',
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
                  // color: Theme.of(context).colorScheme.surface,
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
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
