import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

typedef BabelStyleMapper = TextStyle Function(
    BuildContext context, TextStyle currentStyle);

Map<String, BabelStyleMapper> buildLinkTextStyleMapping(
  Iterable<String> tags,
) =>
    {
      for (final tag in tags)
        tag: (context, currentStyle) => currentStyle.copyWith(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w700,
            ),
    };

Map<String, Future<void> Function(BuildContext context)> buildUrlTapMapping(
  Map<String, String> urlsByTag,
) =>
    {
      for (final entry in urlsByTag.entries)
        entry.key: (_) async {
          await launchUrl(Uri.parse(entry.value));
        },
    };

Map<String, BabelTooltipMessage Function(BuildContext context, TextStyle style)>
    buildLinkTooltipMapping(
  Iterable<String> tags, {
  String message = 'Open reference',
}) =>
        {
          for (final tag in tags)
            tag: (_, __) => BabelTooltipMessage(
                  message,
                  mouseCursor: SystemMouseCursors.click,
                ),
        };
