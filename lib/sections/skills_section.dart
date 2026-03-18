import 'package:flutter/material.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';

const skillsSectionData = CurriculumSectionData(
  id: 'technical-edge',
  title: 'Technical edge',
  tabLabel: 'Tecnical Edge',
  subtitle: 'What sets my work apart',
  description:
      'Deep Flutter expertise, production-grade Dart backend range, advanced AI workflow depth and architecture discipline for products that need to feel fast, stable and built to last.',
  buildChildren: _buildSkillsSectionChildren,
);

List<Widget> _buildSkillsSectionChildren(BuildContext context) => [
      const _SkillsShowcase(),
    ];

class _SkillsShowcase extends StatelessWidget {
  const _SkillsShowcase();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(130),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primaryContainer.withAlpha(180),
            colorScheme.surfaceContainerHighest.withAlpha(110),
          ],
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'I am strongest where polished product execution meets engineering depth.',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            'I have been building with Flutter since the beta era, and I pair that foundation with strong backend, architecture and AI workflow depth. My main strength is not just knowing the popular packages or tools. It is understanding the tradeoffs behind each layer and turning that knowledge into software that feels mature in production.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurface.withAlpha(230),
                  height: 1.45,
                ),
          ),
          const SizedBox(height: 16),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _StrengthChip(label: 'Flutter since beta'),
              _StrengthChip(label: 'Serverpod before 1.0'),
              _StrengthChip(label: 'Performance-first mindset'),
              _StrengthChip(label: 'Offline / sync / realtime'),
              _StrengthChip(label: 'Security-minded backend'),
              _StrengthChip(label: 'Claude Code power user'),
              _StrengthChip(label: 'MCP / agent orchestration'),
            ],
          ),
          const SizedBox(height: 18),
          const _AiSystemsSpotlight(),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              const spacing = 20.0;
              final useTwoColumns = constraints.maxWidth >= 540;
              final blockWidth = useTwoColumns
                  ? (constraints.maxWidth - spacing) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: spacing,
                runSpacing: 20,
                children: [
                  for (final group in _skillGroups)
                    SizedBox(
                      width: blockWidth,
                      child: _SkillGroup(group: group),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AiSystemsSpotlight extends StatelessWidget {
  const _AiSystemsSpotlight();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface.withAlpha(180),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.primary.withAlpha(90),
        ),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI SYSTEMS',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            'I use AI like an engineering system, not like a chat box.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Claude Code is part of my daily toolkit, but the differentiator is not simply knowing prompts. It is knowing how to structure context, tools, agent roles and review loops so the system behaves like an organized engineering team instead of a single assistant window.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withAlpha(230),
                  height: 1.45,
                ),
          ),
          const SizedBox(height: 14),
          const _SkillBullet(
            text:
                'I can split work across multiple agents in parallel, assign clear scopes and orchestrate how their outputs converge back into one coherent implementation.',
          ),
          const SizedBox(height: 10),
          const _SkillBullet(
            text:
                'I design multi-step workflows where agents plan, execute, review and critique their own output, which raises both speed and reliability compared with one-shot prompting.',
          ),
          const SizedBox(height: 10),
          const _SkillBullet(
            text:
                'I write project-specific Skill.md files from scratch, create MCP integrations and adapt the tooling layer to the client\'s stack so the assistant behaves like a specialized teammate.',
          ),
          const SizedBox(height: 10),
          const _SkillBullet(
            text:
                'I am comfortable with LangChain, RAG pipelines, context engineering and AI-driven internal tooling, which lets me help with both AI-assisted delivery and AI-native product features.',
          ),
        ],
      ),
    );
  }
}

class _StrengthChip extends StatelessWidget {
  final String label;

  const _StrengthChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface.withAlpha(170),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: colorScheme.outlineVariant.withAlpha(120),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: colorScheme.onSurface,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _SkillGroup extends StatelessWidget {
  final _SkillGroupData group;

  const _SkillGroup({
    required this.group,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: colorScheme.primary.withAlpha(210),
            width: 3,
          ),
        ),
      ),
      padding: const EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.overline,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            group.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
          ),
          const SizedBox(height: 10),
          for (final bullet in group.bullets) ...[
            _SkillBullet(text: bullet),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _SkillBullet extends StatelessWidget {
  final String text;

  const _SkillBullet({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: colorScheme.primary,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withAlpha(230),
                  height: 1.45,
                ),
          ),
        ),
      ],
    );
  }
}

class _SkillGroupData {
  final String overline;
  final String title;
  final List<String> bullets;

  const _SkillGroupData({
    required this.overline,
    required this.title,
    required this.bullets,
  });
}

const _skillGroups = [
  _SkillGroupData(
    overline: 'FLUTTER',
    title: 'Framework depth across the whole ecosystem',
    bullets: [
      'I have deep hands-on experience with Flutter\'s evolution, which gives me strong intuition for framework internals, edge cases and production tradeoffs.',
      'I can work comfortably with BLoC, Riverpod, GetX, MobX, Triple, Flutter Hooks and native framework primitives, choosing the right state model for the app instead of forcing a favorite.',
      'I am equally comfortable with go_router, auto_route, flutter_modular and related navigation stacks, including deeplinks that behave like first-class production apps.',
    ],
  ),
  _SkillGroupData(
    overline: 'PERFORMANCE',
    title: 'Smoothness, rendering and debugging discipline',
    bullets: [
      'Performance is a standard, not a late optimization. I focus heavily on rebuild control, widget lifecycle discipline, render-pipeline efficiency and eliminating jank before users feel it.',
      'My understanding of the element tree and render tree helps me ship apps that stay responsive under real usage instead of only looking good in happy-path demos.',
      'I use DevTools and profiling intentionally to track down frame drops, memory issues and hard-to-see UI bottlenecks instead of guessing.',
    ],
  ),
  _SkillGroupData(
    overline: 'PRODUCT',
    title: 'Real app concerns beyond the UI layer',
    bullets: [
      'I integrate the growth and product tooling serious apps need, especially PostHog, Firebase Analytics and AppsFlyer.',
      'I build offline-first, sync-heavy and realtime experiences when the product calls for resilience beyond a simple request / response flow.',
      'I treat internationalization as a product feature, not an afterthought. ZenScrap is public evidence of shipping multilingual experiences.',
    ],
  ),
  _SkillGroupData(
    overline: 'BACKEND',
    title: 'Dart backend range with a security mindset',
    bullets: [
      'My backend experience covers Firebase, Supabase and Serverpod as well as shelf, Aqueduct, dart_frog and gRPC, so I can choose between speed, control and long-term maintainability.',
      'I currently favor Serverpod the most and adopted it before 1.0, which gave me deep practical time in the stack.',
      'I write strict Row Level Security with a least-privilege mindset, exposing only the minimum data each user actually needs.',
    ],
  ),
  _SkillGroupData(
    overline: 'ARCHITECTURE',
    title: 'Codebases built to scale with teams',
    bullets: [
      'I structure large projects with package-based monorepos, internal packages and modular boundaries that let features grow without creating chaos.',
      'I use clean architecture where it creates real leverage, especially around critical domain logic and long-lived products.',
      'I care about standards that survive growth: focused test coverage for critical paths, pragmatic use of mocktail / mockito, reusable internal packages and custom lints that keep the codebase aligned over time.',
    ],
  ),
];
