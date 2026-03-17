import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceCodeCard extends StatelessWidget {
  const SourceCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final image = isDarkMode
        ? const OptimizedAsset(
            assetName: 'art/tumbnails/contacts/github.PNG',
            height: 64,
            width: 64,
            fit: BoxFit.cover,
            cacheHeight: 128,
            cacheWidth: 128,
          )
        : Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(4),
            child: const OptimizedAsset(
              assetName: 'art/tumbnails/contacts/github.PNG',
              height: 64,
              width: 64,
              fit: BoxFit.cover,
              cacheHeight: 128,
              cacheWidth: 128,
            ),
          );

    return InkWell(
      onTap: () {
        launchUrl(Uri.parse('https://github.com/igormidev/igorcurriculum'));
        AnalyticsService.instance.openedSiteRepository();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        constraints: const BoxConstraints(minHeight: 92),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final shouldStack = constraints.maxWidth < 460;

            final description = Builder(
              builder: (context) {
                final defaultStyle = TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 13.5,
                  color: Theme.of(context).colorScheme.onPrimary.withAlpha(190),
                  fontStyle: FontStyle.italic,
                );
                final List<TextSpan> spans = [
                  TextSpan(
                    text: 'I created',
                    style: defaultStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.scrim,
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  TextSpan(
                    text: ' this site. Nothing was copied from anywhere. It\'s '
                        'completely my own code, one hundred percent of the writed lines are mine. No templates where used.',
                    style: defaultStyle,
                  ),
                ];

                return RichText(
                  text: TextSpan(children: spans),
                );
              },
            );

            final headerText = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Source Code of this site',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        height: 1,
                      ),
                ),
                Text(
                  'View the source code for this website on my personal GitHub.',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withAlpha(140),
                      ),
                ),
              ],
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
                      Expanded(child: headerText),
                      const Icon(Icons.open_in_new),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(height: 4),
                  description,
                ],
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                image,
                const SizedBox(width: 8),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: 2),
                            headerText,
                            const Divider(height: 4),
                            description,
                          ],
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.open_in_new),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
