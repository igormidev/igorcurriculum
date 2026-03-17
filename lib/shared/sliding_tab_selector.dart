import 'dart:math' as math;

import 'package:flutter/material.dart';

class SlidingTabSelector extends StatefulWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  final bool compact;

  const SlidingTabSelector({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
    this.compact = false,
  });

  @override
  State<SlidingTabSelector> createState() => _SlidingTabSelectorState();
}

class _SlidingTabSelectorState extends State<SlidingTabSelector> {
  final GlobalKey _stackKey = GlobalKey();
  final ScrollController _horizontalScrollController = ScrollController();

  late List<GlobalKey> _itemKeys;
  Rect? _selectedRect;

  @override
  void initState() {
    super.initState();
    _itemKeys = List.generate(widget.labels.length, (_) => GlobalKey());
  }

  @override
  void didUpdateWidget(covariant SlidingTabSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.labels.length != widget.labels.length) {
      _itemKeys = List.generate(widget.labels.length, (_) => GlobalKey());
    }
  }

  @override
  void dispose() {
    _horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final buttonPadding = widget.compact
        ? const EdgeInsets.symmetric(horizontal: 14, vertical: 10)
        : const EdgeInsets.symmetric(horizontal: 18, vertical: 12);

    return LayoutBuilder(
      builder: (context, constraints) {
        final useScrollableLayout = _shouldUseScrollableLayout(
          context,
          constraints.maxWidth,
          buttonPadding.horizontal,
        );

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateSelectedRect(useScrollableLayout);
        });

        return DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withAlpha(90),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: colorScheme.outlineVariant.withAlpha(140),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: useScrollableLayout
                ? SingleChildScrollView(
                    controller: _horizontalScrollController,
                    scrollDirection: Axis.horizontal,
                    child: _TabStack(
                      stackKey: _stackKey,
                      selectedRect: _selectedRect,
                      highlight: _buildHighlight(context),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (var index = 0;
                              index < widget.labels.length;
                              index++)
                            _buildTabButton(
                              context,
                              index,
                              buttonPadding,
                              compact: widget.compact,
                            ),
                        ],
                      ),
                    ),
                  )
                : _TabStack(
                    stackKey: _stackKey,
                    selectedRect: _selectedRect,
                    highlight: _buildHighlight(context),
                    child: Row(
                      children: [
                        for (var index = 0;
                            index < widget.labels.length;
                            index++)
                          Expanded(
                            child: _buildTabButton(
                              context,
                              index,
                              buttonPadding,
                              compact: widget.compact,
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildHighlight(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withAlpha(20),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    BuildContext context,
    int index,
    EdgeInsets buttonPadding, {
    required bool compact,
  }) {
    final isSelected = index == widget.selectedIndex;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        key: _itemKeys[index],
        borderRadius: BorderRadius.circular(16),
        onTap: () => widget.onSelected(index),
        child: Padding(
          padding: buttonPadding,
          child: Center(
            child: Text(
              widget.labels[index],
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: compact ? 13 : 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected
                        ? colorScheme.onSurface
                        : colorScheme.onSurfaceVariant,
                    letterSpacing: 0.1,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  bool _shouldUseScrollableLayout(
    BuildContext context,
    double availableWidth,
    double horizontalPadding,
  ) {
    final textStyle = Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: widget.compact ? 13 : 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.1,
        );

    final totalWidth = widget.labels.fold<double>(
          0,
          (sum, label) =>
              sum + _measureLabelWidth(label, textStyle) + horizontalPadding,
        ) +
        math.max(0, widget.labels.length - 1) * 6;

    return totalWidth > availableWidth - 12;
  }

  double _measureLabelWidth(String label, TextStyle? style) {
    final painter = TextPainter(
      text: TextSpan(text: label, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return painter.width;
  }

  void _updateSelectedRect(bool useScrollableLayout) {
    if (!mounted) {
      return;
    }

    final stackBox = _stackKey.currentContext?.findRenderObject() as RenderBox?;
    final itemBox = _itemKeys[widget.selectedIndex]
        .currentContext
        ?.findRenderObject() as RenderBox?;

    if (stackBox == null || itemBox == null) {
      return;
    }

    final offset = itemBox.localToGlobal(Offset.zero, ancestor: stackBox);
    final nextRect = Rect.fromLTWH(
      offset.dx,
      offset.dy,
      itemBox.size.width,
      itemBox.size.height,
    );

    if (_selectedRect != nextRect) {
      setState(() {
        _selectedRect = nextRect;
      });
    }

    if (useScrollableLayout && _horizontalScrollController.hasClients) {
      final targetOffset = nextRect.center.dx -
          _horizontalScrollController.position.viewportDimension / 2;
      final clampedOffset = targetOffset.clamp(
        _horizontalScrollController.position.minScrollExtent,
        _horizontalScrollController.position.maxScrollExtent,
      );

      if ((clampedOffset - _horizontalScrollController.offset).abs() > 4) {
        _horizontalScrollController.animateTo(
          clampedOffset.toDouble(),
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
        );
      }
    }
  }
}

class _TabStack extends StatelessWidget {
  final GlobalKey stackKey;
  final Rect? selectedRect;
  final Widget highlight;
  final Widget child;

  const _TabStack({
    required this.stackKey,
    required this.selectedRect,
    required this.highlight,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: stackKey,
      children: [
        if (selectedRect != null)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOutCubicEmphasized,
            left: selectedRect!.left,
            top: selectedRect!.top,
            width: selectedRect!.width,
            height: selectedRect!.height,
            child: IgnorePointer(
              child: highlight,
            ),
          ),
        child,
      ],
    );
  }
}
