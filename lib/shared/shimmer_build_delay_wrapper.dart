import 'dart:async';

import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';

class ShimmerBuildDelayWrapper extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final double height;
  const ShimmerBuildDelayWrapper({
    super.key,
    required this.duration,
    required this.child,
    required this.height,
  });

  @override
  State<ShimmerBuildDelayWrapper> createState() =>
      _ShimmerBuildDelayWrapperState();
}

final List<int> alreadyBuildedMillisecons = [];

class _ShimmerBuildDelayWrapperState extends State<ShimmerBuildDelayWrapper> {
  final Completer<void> _delay = Completer<void>();
  late final bool didAlreadyLoadedBefore;

  @override
  void initState() {
    super.initState();
    didAlreadyLoadedBefore =
        alreadyBuildedMillisecons.contains(widget.duration.inMilliseconds);

    if (Constants.isMobileSize) {
      Future.delayed(const Duration(milliseconds: 400), () {
        if (mounted) {
          _delay.complete();
        }
        if (didAlreadyLoadedBefore) {
          return;
        } else {
          alreadyBuildedMillisecons.add(widget.duration.inMilliseconds);
        }
      });
    } else {
      Future.delayed(widget.duration, () {
        if (mounted) {
          _delay.complete();
        }
        if (didAlreadyLoadedBefore) {
          return;
        } else {
          alreadyBuildedMillisecons.add(widget.duration.inMilliseconds);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (didAlreadyLoadedBefore) {
      return widget.child;
    }

    return FutureBuilder<void>(
      future: _delay.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }

        return Container(
          width: Constants.screenWidth,
          height: widget.height,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(8),
          ),
        );
      },
    );
  }
}
