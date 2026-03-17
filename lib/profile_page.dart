import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:igorcurriculum/sections/contact_grid_view.dart';
import 'package:igorcurriculum/sections/curriculum_sections.dart';
import 'package:igorcurriculum/sections/header_section.dart';
import 'package:igorcurriculum/sections/source_code_card.dart';
import 'package:igorcurriculum/shared/shimmer_build_delay_wrapper.dart';
import 'package:igorcurriculum/shared/sliding_tab_selector.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const double _desktopTabsExtent = 78;

  final ScrollController _desktopSectionsScrollController = ScrollController();
  final GlobalKey _desktopViewportKey = GlobalKey();
  late final List<GlobalKey> _desktopSectionKeys =
      List.generate(curriculumSections.length, (_) => GlobalKey());

  int _desktopSelectedSectionIndex = 0;
  int _mobileSelectedTabIndex = 0;
  bool _desktopSyncScheduled = false;

  @override
  void initState() {
    super.initState();
    _desktopSectionsScrollController.addListener(_scheduleDesktopSectionSync);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateDesktopSelectedSection();
    });
  }

  @override
  void dispose() {
    _desktopSectionsScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > Constants.desktopBreakpoint;

          return isDesktop
              ? _buildDesktopLayout(context)
              : SafeArea(child: _buildMobileLayout(context));
        },
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: Constants.screenWidth,
          child: _buildDesktopSectionsPane(context),
        ),
        SizedBox(
          width: Constants.screenWidth,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                ..._buildOverviewChildren(
                  context,
                  useShimmers: true,
                  includeSourceCodeCard: false,
                  topSpacing: false,
                  itemSpacing: 8,
                  trailingSpacing: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopSectionsPane(BuildContext context) {
    return SizedBox.expand(
      key: _desktopViewportKey,
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.depth == 0) {
            _scheduleDesktopSectionSync();
          }
          return false;
        },
        child: CustomScrollView(
          controller: _desktopSectionsScrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _PinnedHeaderDelegate(
                extent: _desktopTabsExtent,
                child: ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SlidingTabSelector(
                        labels: [
                          for (final section in curriculumSections)
                            section.title,
                        ],
                        selectedIndex: _desktopSelectedSectionIndex,
                        onSelected: _scrollToDesktopSection,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 8),
              sliver: SliverList.list(
                children: [
                  for (var index = 0;
                      index < curriculumSections.length;
                      index++)
                    Padding(
                      padding: EdgeInsets.only(
                        bottom:
                            index == curriculumSections.length - 1 ? 32 : 36,
                      ),
                      child: KeyedSubtree(
                        key: _desktopSectionKeys[index],
                        child: curriculumSections[index].build(context),
                      ),
                    ),
                  const Divider(height: 32),
                  const SourceCodeCard(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    final tabs = [
      _ProfileTabData(
        label: 'Overview',
        storageId: 'overview',
        child: _buildTabScrollView(
          storageId: 'overview',
          children: _buildOverviewChildren(
            context,
            useShimmers: false,
            includeSourceCodeCard: true,
          ),
        ),
      ),
      for (final section in curriculumSections)
        _ProfileTabData(
          label: section.title,
          storageId: section.id,
          child: _buildTabScrollView(
            storageId: section.id,
            children: [
              section.build(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
    ];

    final selectedIndex = _mobileSelectedTabIndex.clamp(0, tabs.length - 1);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: SlidingTabSelector(
            labels: [for (final tab in tabs) tab.label],
            selectedIndex: selectedIndex,
            compact: true,
            onSelected: (index) {
              setState(() {
                _mobileSelectedTabIndex = index;
              });
            },
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: selectedIndex,
            children: [
              for (final tab in tabs) tab.child,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabScrollView({
    required String storageId,
    required List<Widget> children,
  }) {
    return CustomScrollView(
      key: PageStorageKey('profile-tab-$storageId'),
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          sliver: SliverList.list(children: children),
        ),
      ],
    );
  }

  List<Widget> _buildOverviewChildren(
    BuildContext context, {
    required bool useShimmers,
    required bool includeSourceCodeCard,
    bool topSpacing = true,
    double itemSpacing = 12,
    bool trailingSpacing = true,
  }) {
    final children = <Widget>[
      if (topSpacing) const SizedBox(height: 8),
      if (useShimmers)
        ShimmerBuildDelayWrapper(
          duration: Constants.profileHeaderDelay,
          height: 260,
          child: const ProfileImage(),
        )
      else
        const ProfileImage(),
      SizedBox(height: itemSpacing),
      if (useShimmers)
        ShimmerBuildDelayWrapper(
          duration: Constants.howIcanHelpYouDelay,
          height: 370,
          child: const WorkingWithMeAdvantages(),
        )
      else
        const WorkingWithMeAdvantages(),
      SizedBox(height: itemSpacing),
      ...buildContactGridView(context),
    ];

    if (includeSourceCodeCard) {
      children.addAll([
        SizedBox(height: itemSpacing),
        const SourceCodeCard(),
      ]);
    }

    if (trailingSpacing) {
      children.add(const SizedBox(height: 20));
    }
    return children;
  }

  void _scheduleDesktopSectionSync() {
    if (_desktopSyncScheduled) {
      return;
    }

    _desktopSyncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _desktopSyncScheduled = false;
      _updateDesktopSelectedSection();
    });
  }

  void _updateDesktopSelectedSection() {
    if (!mounted) {
      return;
    }

    final viewportBox =
        _desktopViewportKey.currentContext?.findRenderObject() as RenderBox?;
    if (viewportBox == null || !viewportBox.attached) {
      return;
    }

    final viewportOrigin = viewportBox.localToGlobal(Offset.zero);
    final visibleTop = viewportOrigin.dy + _desktopTabsExtent;
    final visibleBottom = viewportOrigin.dy + viewportBox.size.height;

    var nextIndex = _desktopSelectedSectionIndex;
    var maxVisibleHeight = -1.0;

    for (var index = 0; index < _desktopSectionKeys.length; index++) {
      final renderBox = _desktopSectionKeys[index]
          .currentContext
          ?.findRenderObject() as RenderBox?;
      if (renderBox == null || !renderBox.attached) {
        continue;
      }

      final sectionTop = renderBox.localToGlobal(Offset.zero).dy;
      final sectionBottom = sectionTop + renderBox.size.height;
      final visibleHeight = math.max<double>(
        0,
        math.min(sectionBottom, visibleBottom) -
            math.max(sectionTop, visibleTop),
      );

      if (visibleHeight > maxVisibleHeight) {
        maxVisibleHeight = visibleHeight;
        nextIndex = index;
      }
    }

    if (nextIndex != _desktopSelectedSectionIndex) {
      setState(() {
        _desktopSelectedSectionIndex = nextIndex;
      });
    }
  }

  Future<void> _scrollToDesktopSection(int index) async {
    setState(() {
      _desktopSelectedSectionIndex = index;
    });

    if (!_desktopSectionsScrollController.hasClients) {
      return;
    }

    final targetContext = _desktopSectionKeys[index].currentContext;
    if (targetContext == null) {
      return;
    }

    final renderObject = targetContext.findRenderObject();
    if (renderObject == null) {
      return;
    }

    final viewport = RenderAbstractViewport.of(renderObject);

    final targetOffset =
        viewport.getOffsetToReveal(renderObject, 0).offset - _desktopTabsExtent;
    final position = _desktopSectionsScrollController.position;
    final clampedOffset = targetOffset.clamp(
      position.minScrollExtent,
      position.maxScrollExtent,
    );

    await _desktopSectionsScrollController.animateTo(
      clampedOffset.toDouble(),
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }
}

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double extent;
  final Widget child;

  const _PinnedHeaderDelegate({
    required this.extent,
    required this.child,
  });

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _PinnedHeaderDelegate oldDelegate) {
    return oldDelegate.extent != extent || oldDelegate.child != child;
  }
}

class _ProfileTabData {
  final String label;
  final String storageId;
  final Widget child;

  const _ProfileTabData({
    required this.label,
    required this.storageId,
    required this.child,
  });
}
