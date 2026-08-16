import 'dart:async';
import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:igorcurriculum/shared/optimized_asset.dart';
import 'package:igorcurriculum/theme_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ChangeLightModeWidget extends StatefulWidget {
  const ChangeLightModeWidget({super.key});

  @override
  State<ChangeLightModeWidget> createState() => _ChangeLightModeWidgetState();
}

class _ChangeLightModeWidgetState extends State<ChangeLightModeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLight = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: 2100.milliseconds,
      value: 0.2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      onTap: () async {
        await _controller.animateTo(isLight ? 0.2 : 0.4);
        isLight = !isLight;
        if (context.mounted) {
          context.read<ThemeProvider>().changeBrightness(
                context.read<ThemeProvider>().brightness == Brightness.light
                    ? Brightness.dark
                    : Brightness.light,
              );
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 12),
          SizedBox(
            height: 43,
            width: 100,
            child: Transform.scale(
              scale: 1.8,
              child: Lottie.asset(
                'art/lighting_mode.json',
                fit: BoxFit.fitHeight,
                controller: _controller,
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class FiveStarWidget extends StatefulWidget {
  final bool showLeadingDot;
  final double width;

  const FiveStarWidget({
    super.key,
    this.showLeadingDot = true,
    this.width = 200,
  });

  @override
  State<FiveStarWidget> createState() => _FiveStarWidgetState();
}

class _FiveStarWidgetState extends State<FiveStarWidget> {
  final Completer _completer = Completer();

  @override
  void initState() {
    super.initState();
    Future.delayed(6.seconds, () {
      _completer.complete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _completer.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.showLeadingDot)
                const Text(
                  ' • ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 27,
                  ),
                ),
              Lottie.asset(
                'art/five_star_animation.json',
                width: widget.width,
                fit: BoxFit.cover,
                repeat: false,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Constants.isMobileSize) {
      return const _MobileProfileHeader();
    }

    const width = 180.0;
    return SizedBox(
      height: 260,
      width: double.maxFinite,
      child: Stack(
        children: [
          SizedBox.expand(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      '  Flutter Specialist  ',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox.expand(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        // MediaQuery.of(context).platformBrightness
                        context.read<ThemeProvider>().brightness ==
                                Brightness.light
                            ? 'Light mode'
                            : 'Dark mode',
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withAlpha(
                            100,
                          ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: const ChangeLightModeWidget(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox.expand(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 134.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 280,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Change theme',
                        ),
                      ),
                    ),
                    Container(
                      width: 280,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest
                            .withAlpha(
                              100,
                            ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                        child: GridView.extent(
                          shrinkWrap: true,
                          maxCrossAxisExtent: 20,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          children: const <Color>[Colors.black, Colors.white]
                              .followedBy(Colors.primaries.reversed)
                              .followedBy(Colors.accents)
                              .where(_removeBlackAndWhite)
                              .map(ColorOption.fromColor)
                              .toList(growable: false),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 220,
              width: width,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(180),
                  topRight: Radius.circular(180),
                ),
              ),
              child: const OptimizedAsset(
                assetName: 'art/me.PNG',
                height: 220,
                width: width,
                fit: BoxFit.cover,
                cacheHeight: 440,
                cacheWidth: 360,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceContainerHighest
                    .withAlpha(
                      100,
                    ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              margin: const EdgeInsets.only(right: width + 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'Igor miranda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                      FiveStarWidget(),
                    ],
                  ),
                  const Divider(),
                  InkWell(
                    onTap: () {
                      launchUrl(
                        Uri.parse(
                          'https://www.upwork.com/freelancers/igormidev',
                        ),
                      );
                    },
                    child: BabelText(
                      '✅ Upwork top rated freelancer with <b>100%<b> '
                      'success rate (best <b>5%<b> of platform)',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.outline,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  BabelText(
                    '✅ Client experience is my number <b>1<b> priority',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.outline,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _removeBlackAndWhite(Color color) =>
      color != Colors.black && color != Colors.white;
}

class _MobileProfileHeader extends StatelessWidget {
  static const double _identityHeight = 260;
  static const double _controlsHeight = 136;

  const _MobileProfileHeader();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final photoWidth = (constraints.maxWidth * 0.46).clamp(132.0, 220.0);

        return Column(
          children: [
            SizedBox(
              height: _identityHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: _buildIdentityCard(context)),
                  const SizedBox(width: 12),
                  _buildPhotoCard(context, photoWidth),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: _controlsHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 5,
                    child: _buildModeControl(context),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 9,
                    child: _buildColorControl(context),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildIdentityCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withAlpha(100),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Igor miranda',
            maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              height: 1.05,
            ),
          ),
          const SizedBox(
            height: 38,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FiveStarWidget(
                showLeadingDot: false,
                width: 138,
              ),
            ),
          ),
          const Divider(height: 14),
          InkWell(
            onTap: () {
              launchUrl(
                Uri.parse('https://www.upwork.com/freelancers/igormidev'),
              );
            },
            child: BabelText(
              '✅ Upwork top rated freelancer with <b>100%<b> success rate '
              '(best <b>5%<b> of platform)',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                color: colorScheme.outline,
                fontSize: 12.5,
                height: 1.25,
              ),
            ),
          ),
          const SizedBox(height: 5),
          BabelText(
            '✅ Client experience is my number <b>1<b> priority',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              color: colorScheme.outline,
              fontSize: 12.5,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoCard(BuildContext context, double width) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(180),
          topRight: Radius.circular(180),
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: OptimizedAsset(
              assetName: 'art/me.PNG',
              height: 220,
              width: width,
              fit: BoxFit.cover,
              cacheHeight: 440,
              cacheWidth: 440,
            ),
          ),
          SizedBox(
            height: 40,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Flutter Specialist',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModeControl(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isLight =
        context.watch<ThemeProvider>().brightness == Brightness.light;

    return _MobileThemeControl(
      title: isLight ? 'Light mode' : 'Dark mode',
      colorScheme: colorScheme,
      child: const ChangeLightModeWidget(),
    );
  }

  Widget _buildColorControl(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colors = const <Color>[Colors.black, Colors.white]
        .followedBy(Colors.primaries.reversed)
        .followedBy(Colors.accents)
        .where(
          (color) => color != Colors.black && color != Colors.white,
        )
        .toList(growable: false);

    return _MobileThemeControl(
      title: 'Change theme',
      colorScheme: colorScheme,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: GridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 20,
          mainAxisSpacing: 3,
          crossAxisSpacing: 3,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          children: colors.map(ColorOption.fromColor).toList(growable: false),
        ),
      ),
    );
  }
}

class _MobileThemeControl extends StatelessWidget {
  final String title;
  final Widget child;
  final ColorScheme colorScheme;

  const _MobileThemeControl({
    required this.title,
    required this.child,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ColoredBox(
        color: colorScheme.surfaceContainerHighest.withAlpha(100),
        child: Column(
          children: [
            ColoredBox(
              color: colorScheme.surfaceContainerHighest,
              child: SizedBox(
                height: 36,
                width: double.infinity,
                child: Center(child: Text(title)),
              ),
            ),
            Expanded(child: Center(child: child)),
          ],
        ),
      ),
    );
  }
}

class ColorOption extends StatelessWidget {
  const ColorOption({
    super.key,
    required this.color,
  });

  factory ColorOption.fromColor(Color color) => ColorOption(color: color);

  final Color color;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ThemeProvider>();
    final isSelected = provider.colorValue == color.toARGB32();

    return InkWell(
      onTap: () {
        provider.selectColor(color);
      },
      child: SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isSelected)
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                radius: 20,
              ),
            CircleAvatar(
              backgroundColor: color,
              radius: isSelected ? 7 : 20,
            ),
          ],
        ),
      ),
    );
  }
}

class WorkingWithMeAdvantages extends StatelessWidget {
  const WorkingWithMeAdvantages({super.key});

  @override
  Widget build(BuildContext context) {
    const delay = 800.0;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest
            .withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: const BoxConstraints(minHeight: 370),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          Text(
            'How can i help you?',
            style: GoogleFonts.italiana(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            'Working with me, you will:',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Theme.of(context).colorScheme.outline,
              fontStyle: FontStyle.italic,
            ),
          ),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 750).milliseconds,
            text: '<b><pC>Ensure<pC><b> that your user has an application that '
                '<u><i>runs smoothly<i><u> and is not constantly plagued by '
                'bugs.',
          ),
          const Divider(),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 1500).milliseconds,
            text:
                'Have <b><pC>clean code<pC><b>. Easy to <u><b>maintain<b><u>, '
                '<u><b>modify<b><u> and <u><b>scale<b><u>. No more starting '
                'the project at a great speed and after a while spending more '
                'time correcting code than writing new features.',
          ),
          const Divider(),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 2250).milliseconds,
            text:
                'Receive <b><pC>constant updates<pC><b>. You will always know '
                'what I did <u><b>yesterday<b><u>, <u><b>today<b><u> and what '
                'I\'m going to do <u><b>tomorrow<b><u>.',
          ),
          const Divider(),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 3000).milliseconds,
            text:
                '<u><i><b><pC>SAVE MONEY<pC><b><i><u> by working with someone '
                'who doesn\'t screw around just to get more paid hours. I have '
                '<u><b>zero interest<b><u> in making the project take longer '
                'than necessary to deliver it with quality.',
          ),
        ],
      ),
    );
  }
}

class WorkingWithMeAdvantagesTile extends StatefulWidget {
  final Duration animationDelay;
  final String text;

  const WorkingWithMeAdvantagesTile({
    super.key,
    required this.text,
    required this.animationDelay,
  });

  @override
  State<WorkingWithMeAdvantagesTile> createState() =>
      _WorkingWithMeAdvantagesTileState();
}

class _WorkingWithMeAdvantagesTileState
    extends State<WorkingWithMeAdvantagesTile> {
  bool willAnimate = false;
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer(widget.animationDelay, () {
      setState(() {
        willAnimate = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontWeight: FontWeight.w400,
      color: Theme.of(context).colorScheme.outline,
      fontSize: 16,
    );

    return Row(
      children: [
        SizedBox(
          width: 50,
          child: LottieBuilder.asset(
            'art/solo_star.json',
            fit: BoxFit.cover,
            animate: willAnimate,
            repeat: false,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: BabelSelectableText(
              widget.text,
              style: defaultStyle,
            ),
          ),
        ),
      ],
    );
  }
}
