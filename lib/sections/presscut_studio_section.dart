import 'package:flutter/material.dart';
import 'package:igorcurriculum/services/analytics_service.dart';
import 'package:igorcurriculum/shared/curriculum_section.dart';
import 'package:igorcurriculum/shared/project_showcase_card.dart';

const _studioUrl = 'https://igormidev.github.io/presscut-studio/';
const _repositoryUrl = 'https://github.com/igormidev/presscut-studio';

const presscutStudioSectionData = CurriculumSectionData(
  id: 'presscut-studio',
  title: 'Presscut Studio',
  tabLabel: 'Presscut Studio',
  subtitle: 'Open-source creator tool',
  description:
      'I built this browser-based creative studio for my YouTube workflow: turn images, lettering and video into ready-to-edit editorial graphics without rebuilding the same effects by hand.',
  buildChildren: _buildPresscutStudioSectionChildren,
);

List<Widget> _buildPresscutStudioSectionChildren(BuildContext context) => [
      const ProjectShowcaseCard(
        title: ' ✂️ Presscut Studio — Paper style. In motion. ',
        titleLinkUrl: _studioUrl,
        onTitleTap: _logOpenedPresscutStudio,
        shortDescription:
            '''A free, <b>open-source creative studio<b> for newspaper-style image cutouts, animated magazine lettering and taped video frames.

Built for my own YouTube editing workflow, it exports <b>transparent PNG images and MOV overlays<b> for CapCut, with media processing kept <soft>inside the browser<soft>.''',
        description:
            '''Presscut Studio turns a repetitive video-editing task into a reusable <b>browser-based creative workflow<b>.

 ⦿ Cut images into newspaper-style silhouettes with irregular paper borders, shadows, halftone dots and crumpled-paper texture
 ⦿ Animate paper with hand placement, unfolding and torn-piece reveals
 ⦿ Create magazine-style lettering with typewriter and word reveals, changing letter styles and audio timing tools
 ⦿ Frame uploaded video with tape, preserve its original sound and extend it with a held final frame, looping or reverse playback
 ⦿ Export transparent PNGs and alpha-channel MOV overlays for editing in CapCut

Built with <b>React and TypeScript<b>, canvas rendering and browser-side media encoding. Independent artboards keep multiple edits separate, and the responsive interface works on desktop and mobile. The app is hosted on <b>GitHub Pages<b>; media is processed locally in the browser.''',
        imageAssetName: 'art/tumbnails/apps/presscut_studio.png',
        size: Size(190, 190),
        fit: BoxFit.contain,
        stackImageOnNarrowWidth: true,
        actions: [
          ProjectShowcaseAction(
            label: 'Try Presscut Studio',
            url: _studioUrl,
            onTap: _logOpenedPresscutStudio,
          ),
          ProjectShowcaseAction(
            label: 'Explore the source code',
            url: _repositoryUrl,
            onTap: _logOpenedPresscutRepository,
          ),
        ],
        cacheHeight: 512,
        cacheWidth: 512,
      ),
    ];

void _logOpenedPresscutStudio() =>
    AnalyticsService.instance.logOpenedLiveDemo('presscut_studio');

void _logOpenedPresscutRepository() =>
    AnalyticsService.instance.logOpenedProjectRepository('presscut_studio');
