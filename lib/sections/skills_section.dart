import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/shared/babel_text_utils.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';

const skillsSectionData = CurriculumSectionData(
  id: 'technical-edge',
  title: 'Technical edge',
  tabLabel: 'Tecnical Edge',
  subtitle: 'What sets my work apart',
  description: null,
  // 'Deep Flutter expertise, production-grade Dart backend range, advanced AI workflow depth and architecture discipline for products that need to feel fast, stable and built to last.',
  buildChildren: _buildSkillsSectionChildren,
);

const _skillReferenceUrls = {
  '<flutter>': 'https://docs.flutter.dev/',
  '<serverpod>': 'https://docs.serverpod.dev/',
  '<bloc>': 'https://bloclibrary.dev/',
  '<riverpod>': 'https://riverpod.dev/',
  '<getX>': 'https://pub.dev/packages/get',
  '<mobX>': 'https://pub.dev/packages/mobx',
  '<triple>': 'https://pub.dev/packages/flutter_triple',
  '<flutterHooks>': 'https://pub.dev/packages/flutter_hooks',
  '<goRouter>': 'https://pub.dev/packages/go_router',
  '<autoRoute>': 'https://pub.dev/packages/auto_route',
  '<flutterModular>': 'https://pub.dev/packages/flutter_modular',
  '<devTools>': 'https://docs.flutter.dev/tools/devtools/overview',
  '<elementTree>': 'https://docs.flutter.dev/resources/inside-flutter',
  '<renderTree>': 'https://docs.flutter.dev/resources/inside-flutter',
  '<deepLinks>': 'https://docs.flutter.dev/ui/navigation/deep-linking',
  '<postHog>': 'https://posthog.com/product-analytics',
  '<firebaseAnalytics>': 'https://firebase.google.com/docs/analytics',
  '<appsFlyer>': 'https://www.appsflyer.com/',
  '<firebase>': 'https://firebase.google.com/',
  '<supabase>': 'https://supabase.com/docs',
  '<shelf>': 'https://pub.dev/packages/shelf',
  '<aqueduct>': 'https://pub.dev/packages/aqueduct',
  '<dartFrog>': 'https://pub.dev/packages/dart_frog',
  '<grpc>': 'https://grpc.io/docs/languages/dart/quickstart/',
  '<rowLevelSecurity>':
      'https://supabase.com/docs/guides/database/postgres/row-level-security',
  '<offlineFirst>':
      'https://docs.flutter.dev/app-architecture/design-patterns/offline-first',
  '<internationalization>': 'https://docs.flutter.dev/ui/internationalization',
  '<workspaces>': 'https://dart.dev/tools/pub/workspaces',
  '<mocktail>': 'https://pub.dev/packages/mocktail',
  '<mockito>': 'https://pub.dev/packages/mockito',
  '<claudeCode>': 'https://code.claude.com/docs/en/overview',
  '<mcp>': 'https://modelcontextprotocol.io/docs/getting-started/intro',
  '<langChain>': 'https://docs.langchain.com/oss/python/langchain/overview',
  '<rag>': 'https://docs.langchain.com/oss/python/langchain/rag',
  '<zenScrap>': 'https://www.zenscrap.com/',
};

final _skillLinkStyleMapping = buildLinkTextStyleMapping(
  _skillReferenceUrls.keys,
);
final _skillLinkTapMapping = buildUrlTapMapping(_skillReferenceUrls);
final _skillLinkTooltipMapping = buildLinkTooltipMapping(
  _skillReferenceUrls.keys,
  message: 'Open docs or package',
);

List<Widget> _buildSkillsSectionChildren(BuildContext context) => [
      const _SkillsShowcase(),
    ];

class _SkillsShowcase extends StatelessWidget {
  const _SkillsShowcase();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BabelSelectableText(
          'I have been building with <flutter>Flutter<flutter> since the beta '
          'era, and I pair that foundation with strong backend, architecture '
          'and AI workflow depth. My main strength is not just knowing the '
          'popular packages or tools. It is understanding the <b>tradeoffs '
          'behind each layer<b> and turning that knowledge into software '
          'that feels <sC>mature in production<sC>.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withAlpha(230),
                height: 1.45,
              ),
          styleMapping: _skillLinkStyleMapping,
          onTapMapping: _skillLinkTapMapping,
          onHoverTooltipMapping: _skillLinkTooltipMapping,
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
        const SizedBox(height: 18),
        const _AiSystemsSpotlight(),
      ],
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
          BabelSelectableText(
            '<claudeCode>Claude Code<claudeCode> is part of my daily toolkit, '
            'but the differentiator is not simply knowing prompts. It is '
            'knowing how to structure context, tools, <mcp>MCP<mcp> agent '
            'roles and review loops so the system behaves like an organized '
            'engineering team instead of a single assistant window.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.outline,
                  fontWeight: FontWeight.w300,
                  height: 1.45,
                ),
            styleMapping: _skillLinkStyleMapping,
            onTapMapping: _skillLinkTapMapping,
            onHoverTooltipMapping: _skillLinkTooltipMapping,
          ),
          const SizedBox(height: 14),
          const _SkillBullet(
            text:
                'I can split work across multiple agents in parallel, assign <b>clear scopes<b> and orchestrate how their outputs converge back into one coherent implementation.',
          ),
          const SizedBox(height: 10),
          const _SkillBullet(
            text:
                'I design multi-step workflows where agents <b>plan, execute, review and critique<b> their own output, which raises both speed and reliability compared with one-shot prompting.',
          ),
          const SizedBox(height: 10),
          const _SkillBullet(
            text:
                'I write project-specific <b>Skill.md files<b> from scratch, create <mcp>MCP<mcp> integrations and adapt the tooling layer to the client\'s stack so the assistant behaves like a specialized teammate.',
          ),
          const SizedBox(height: 10),
          const _SkillBullet(
            text:
                'I am comfortable with <langChain>LangChain<langChain>, <rag><b>RAG pipelines<b><rag>, context engineering and AI-driven internal tooling, which lets me help with both AI-assisted delivery and AI-native product features.',
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
          child: BabelSelectableText(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withAlpha(230),
                  height: 1.45,
                ),
            styleMapping: _skillLinkStyleMapping,
            onTapMapping: _skillLinkTapMapping,
            onHoverTooltipMapping: _skillLinkTooltipMapping,
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
      'I have deep hands-on experience with <flutter>Flutter<flutter>\'s evolution, which gives me strong intuition for <b>framework internals<b>, edge cases and production tradeoffs.',
      'I can work comfortably with <bloc>BLoC<bloc>, <riverpod>Riverpod<riverpod>, <getX>GetX<getX>, <mobX>MobX<mobX>, <triple>Triple<triple>, <flutterHooks>Flutter Hooks<flutterHooks> and native framework primitives, choosing the right state model for the app instead of forcing a favorite.',
      'I am equally comfortable with <goRouter>go_router<goRouter>, <autoRoute>auto_route<autoRoute>, <flutterModular>flutter_modular<flutterModular> and related navigation stacks, including <deepLinks>deep links<deepLinks> that behave like <sC>first-class production apps<sC>.',
    ],
  ),
  _SkillGroupData(
    overline: 'PERFORMANCE',
    title: 'Smoothness, rendering and debugging discipline',
    bullets: [
      'Performance is a standard, not a late optimization. I focus heavily on <b>rebuild control<b>, widget lifecycle discipline, render-pipeline efficiency and eliminating jank before users feel it.',
      'My understanding of the <elementTree>element tree<elementTree> and <renderTree>render tree<renderTree> helps me ship apps that stay responsive under real usage instead of only looking good in happy-path demos.',
      'I use <devTools>DevTools<devTools> and profiling intentionally to track down frame drops, memory issues and hard-to-see UI bottlenecks instead of guessing.',
    ],
  ),
  _SkillGroupData(
    overline: 'PRODUCT',
    title: 'Real app concerns beyond the UI layer',
    bullets: [
      'I integrate the growth and product tooling serious apps need, especially <postHog>PostHog<postHog>, <firebaseAnalytics>Firebase Analytics<firebaseAnalytics> and <appsFlyer>AppsFlyer<appsFlyer>.',
      'I build <offlineFirst><b>offline-first<b><offlineFirst>, sync-heavy and realtime experiences when the product calls for resilience beyond a simple request / response flow.',
      'I treat <internationalization>internationalization<internationalization> as a product feature, not an afterthought. My SaaS <zenScrap><sC>ZenScrap<zenScrap><sC> is public evidence of shipping multilingual experiences.',
    ],
  ),
  _SkillGroupData(
    overline: 'BACKEND',
    title: 'Dart backend range with a security mindset',
    bullets: [
      'My backend experience covers <firebase>Firebase<firebase>, <supabase>Supabase<supabase> and <serverpod>Serverpod<serverpod> as well as <shelf>shelf<shelf>, <aqueduct>Aqueduct<aqueduct>, <dartFrog>dart_frog<dartFrog> and <grpc>gRPC<grpc>, so I can choose between speed, control and long-term maintainability.',
      'I currently favor <serverpod>Serverpod<serverpod> the most and adopted it before 1.0, which gave me deep practical time in the stack.',
      'I write strict <rowLevelSecurity>Row Level Security<rowLevelSecurity> with a least-privilege mindset, exposing only the minimum data each user actually needs.',
    ],
  ),
  _SkillGroupData(
    overline: 'ARCHITECTURE',
    title: 'Codebases built to scale with teams',
    bullets: [
      'I structure large projects with <workspaces><b>package-based monorepos<b><workspaces>, internal packages and modular boundaries that let features grow without creating chaos.',
      'I use clean architecture where it creates real leverage, especially around critical domain logic and long-lived products.',
      'I care about standards that survive growth: focused test coverage for critical paths, pragmatic use of <mocktail>mocktail<mocktail> / <mockito>mockito<mockito>, reusable internal packages and custom lints that keep the codebase aligned over time.',
    ],
  ),
];
