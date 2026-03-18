import 'dart:math' as math;

import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/shared/babel_text_utils.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectShowcaseAction {
  final String label;
  final String url;
  final VoidCallback? onTap;

  const ProjectShowcaseAction({
    required this.label,
    required this.url,
    this.onTap,
  });
}

class ProjectShowcaseCard extends StatefulWidget {
  final String title;
  final String description;
  final String shortDescription;
  final String imageAssetName;
  final String titleLinkUrl;
  final VoidCallback? onTitleTap;
  final Size? size;
  final int cacheWidth;
  final int cacheHeight;
  final Map<String, String> linkTags;
  final BoxFit fit;
  final List<ProjectShowcaseAction> actions;
  final Widget? expandedFooter;
  final bool stackImageOnNarrowWidth;

  const ProjectShowcaseCard({
    super.key,
    required this.title,
    required this.description,
    required this.shortDescription,
    required this.imageAssetName,
    required this.titleLinkUrl,
    required this.cacheWidth,
    required this.cacheHeight,
    this.linkTags = const {},
    this.onTitleTap,
    this.fit = BoxFit.cover,
    this.actions = const [],
    this.expandedFooter,
    this.stackImageOnNarrowWidth = false,
    this.size,
  });

  @override
  State<ProjectShowcaseCard> createState() => _ProjectShowcaseCardState();
}

class _ProjectShowcaseCardState extends State<ProjectShowcaseCard> {
  bool showShortDescription = true;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.outline,
      fontSize: 13,
    );

    final image = OptimizedAsset(
      assetName: widget.imageAssetName,
      height: widget.size?.height ?? 67,
      width: widget.size?.width ?? 120,
      fit: widget.fit,
      cacheWidth: widget.cacheWidth,
      cacheHeight: widget.cacheHeight,
    );

    final textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            widget.onTitleTap?.call();
            launchUrl(Uri.parse(widget.titleLinkUrl));
          },
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.open_in_new_rounded),
            ],
          ),
        ),
        const SizedBox(height: 4),
        BabelSelectableText(
          showShortDescription
              ? '${widget.shortDescription.trimRight()}\n\n<toggle>See more<toggle>'
              : '${widget.description.trimRight()}\n\n<toggle>See less<toggle>',
          style: style,
          styleMapping: {
            ...buildLinkTextStyleMapping(widget.linkTags.keys),
            ...buildLinkTextStyleMapping(const {'<toggle>'}),
          },
          onTapMapping: {
            ...buildUrlTapMapping(widget.linkTags),
            '<toggle>': (_) {
              setState(() {
                showShortDescription = !showShortDescription;
              });
            },
          },
          onHoverTooltipMapping: {
            ...buildLinkTooltipMapping(
              widget.linkTags.keys,
              message: 'Open docs or package',
            ),
            ...buildLinkTooltipMapping(
              const {'<toggle>'},
              message: 'Toggle full description',
            ),
          },
        ),
        if (!showShortDescription && widget.expandedFooter != null) ...[
          const SizedBox(height: 12),
          widget.expandedFooter!,
        ],
      ],
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final imageWidth = widget.size?.width ?? 120;
              final automaticStackBreakpoint = imageWidth + 300;
              final preferredStackBreakpoint =
                  widget.stackImageOnNarrowWidth ? 500.0 : 0.0;
              final shouldStackImage = constraints.maxWidth <
                  math.max(automaticStackBreakpoint, preferredStackBreakpoint);

              if (shouldStackImage) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textContent,
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: image,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: textContent),
                  const SizedBox(width: 8),
                  image,
                ],
              );
            },
          ),
          if (widget.actions.isNotEmpty) ...[
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                final buttons = widget.actions
                    .map(
                      (action) => _ShowcaseActionButton(
                        action: action,
                      ),
                    )
                    .toList();

                if (constraints.maxWidth < 560 && buttons.length > 1) {
                  return Column(
                    children: [
                      for (var index = 0; index < buttons.length; index++) ...[
                        buttons[index],
                        if (index != buttons.length - 1)
                          const SizedBox(height: 8),
                      ],
                    ],
                  );
                }

                return Row(
                  children: [
                    for (var index = 0; index < buttons.length; index++) ...[
                      Expanded(child: buttons[index]),
                      if (index != buttons.length - 1) const SizedBox(width: 8),
                    ],
                  ],
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _ShowcaseActionButton extends StatelessWidget {
  final ProjectShowcaseAction action;

  const _ShowcaseActionButton({
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action.onTap?.call();
        launchUrl(Uri.parse(action.url));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Expanded(
              child: Text(
                action.label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.open_in_new_rounded),
          ],
        ),
      ),
    );
  }
}
