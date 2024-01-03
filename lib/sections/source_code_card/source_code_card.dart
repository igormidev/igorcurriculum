import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class SourceCodeCard extends StatelessWidget {
  const SourceCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(4),
              child: const ImageNetwork(
                image:
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/GitHub_Invertocat_Logo.svg/1200px-GitHub_Invertocat_Logo.svg.png',
                height: 64,
                width: 64,
                fitWeb: BoxFitWeb.cover,
                onLoading: CircularProgressIndicator.adaptive(),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 2),
                      Text(
                        'Source Code of this site',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              height: 0.7,
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
                      const Divider(height: 4),
                      Builder(
                        builder: (context) {
                          final defaultStyle = TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 13.5,
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withAlpha(190),
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
                              text:
                                  ' this site. Nothing was copied from anywhere. It\'s '
                                  'completely my own code, one hundred percent of the writed lines are mine. No templates where used.',
                              style: defaultStyle,
                            ),
                          ];

                          return RichText(
                            text: TextSpan(
                              children: spans,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.open_in_new),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
