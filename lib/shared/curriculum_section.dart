import 'package:flutter/material.dart';

typedef CurriculumSectionChildrenBuilder = List<Widget> Function(
  BuildContext context,
);

class CurriculumSectionData {
  final String id;
  final String title;
  final String tabLabel;
  final String subtitle;
  final String description;
  final CurriculumSectionChildrenBuilder buildChildren;

  const CurriculumSectionData({
    required this.id,
    required this.title,
    required this.tabLabel,
    required this.subtitle,
    required this.description,
    required this.buildChildren,
  });

  Widget build(BuildContext context) {
    return CurriculumSection(
      data: this,
      children: buildChildren(context),
    );
  }
}

class CurriculumSection extends StatelessWidget {
  final CurriculumSectionData data;
  final List<Widget> children;

  const CurriculumSection({
    super.key,
    required this.data,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: data.title,
          subtitle: data.subtitle,
        ),
        const SizedBox(height: 10),
        Text(
          data.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.outline,
                fontWeight: FontWeight.w300,
                height: 1.45,
              ),
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 8,
      runSpacing: 6,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: colorScheme.onPrimaryContainer,
                height: 1.05,
              ),
        ),
        Text(
          '• $subtitle',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: colorScheme.outline,
                height: 1.05,
              ),
        ),
      ],
    );
  }
}
