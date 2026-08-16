import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';
import 'package:igorcurriculum/shared/project_showcase_card.dart';

const _googlePlayUrl =
    'https://play.google.com/store/apps/details?id=com.root_hub_flutter';
const _appleAppStoreUrl = 'https://apps.apple.com/br/app/root-hub/id6759731801';

const rootHubSectionData = CurriculumSectionData(
  id: 'root-hub',
  title: 'Root Hub',
  tabLabel: 'Root Hub',
  subtitle: 'Published app',
  description:
      'My founder-built iOS and Android app for the ROOT board-game community, now serving approximately 60 monthly active users.',
  buildChildren: _buildRootHubSectionChildren,
);

List<Widget> _buildRootHubSectionChildren(BuildContext context) => [
      const ProjectShowcaseCard(
        title: ' 📱 Root Hub - Find tables. Build your ranking.  ',
        titleLinkUrl: _googlePlayUrl,
        onTitleTap: _logOpenedRootHubGooglePlay,
        shortDescription:
            '''💡 Root Hub connects ROOT board-game players through <b>nearby table discovery<b>, shared match invites, rich chat and one <rating><b>community ranking system<b><rating>.

I built and published the full product across Flutter, Serverpod and a lightweight Jaspr web portal. It has approximately <soft>60 monthly active users<soft>.  ''',
        description:
            '''💡 Root Hub is a production <flutter><b>Flutter<b><flutter> app for iOS and Android, backed by <serverpod><b>Serverpod<b><serverpod> and PostgreSQL.

The player journey includes:
 ⦿ Find and host nearby tables with Google Places-backed locations
 ⦿ Share compact invites that preserve deep-link payloads through install and store fallback
 ⦿ Coordinate with text, image and voice chat, replies, reactions, typing/read state and localized push notifications
 ⦿ Register matches with proof and explore player, faction and global rating history
 ⦿ Ask ROOT rules questions through a streamed <openai><b>OpenAI file-search assistant<b><openai> grounded in multilingual rules and FAQs

The competitive system is a <rating>custom opponent-relative rating model<rating> with 13 faction ratings, break-even score targets, favorite/underdog pressure, starter protection, winner bonuses and an auditable rebuildable ledger.

The delivery stack also includes Riverpod, Freezed, go_router, Firebase Cloud Messaging, PostHog, Shorebird code push, media storage with BlurHash previews, multilingual client/server contracts and a <lint><b>custom lint plugin<b><lint> that enforces component structure, localization, endpoint versioning and API language contracts.''',
        linkTags: {
          '<flutter>': 'https://docs.flutter.dev/',
          '<serverpod>': 'https://docs.serverpod.dev/',
          '<openai>':
              'https://platform.openai.com/docs/guides/tools-file-search',
          '<rating>': _googlePlayUrl,
          '<lint>': 'https://pub.dev/packages/custom_lint',
        },
        imageAssetName: 'art/tumbnails/apps/root_hub.png',
        size: Size(190, 190),
        fit: BoxFit.contain,
        stackImageOnNarrowWidth: true,
        actions: [
          ProjectShowcaseAction(
            label: 'Open on Google Play',
            url: _googlePlayUrl,
            onTap: _logOpenedRootHubGooglePlay,
          ),
          ProjectShowcaseAction(
            label: 'Open on the App Store',
            url: _appleAppStoreUrl,
            onTap: _logOpenedRootHubAppStore,
          ),
        ],
        cacheHeight: 512,
        cacheWidth: 512,
      ),
    ];

void _logOpenedRootHubGooglePlay() => AnalyticsService.instance
    .logOpenedPublishedAppStore('root_hub', 'google_play');

void _logOpenedRootHubAppStore() => AnalyticsService.instance
    .logOpenedPublishedAppStore('root_hub', 'apple_app_store');
