import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igorcurriculum/theme_provider.dart';
import 'package:image_network/image_network.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
  const FiveStarWidget({super.key});

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
              const Text(
                ' • ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
              ),
              Lottie.asset(
                'art/five_star_animation.json',
                width: 200,
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
                  color: Theme.of(context).colorScheme.surfaceVariant,
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
                      color: Theme.of(context).colorScheme.surfaceVariant,
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
                          .surfaceVariant
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
                padding: const EdgeInsets.only(left: 128.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 280,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
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
                            .surfaceVariant
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
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(180),
                  topRight: Radius.circular(180),
                ),
              ),
              child: const ImageNetwork(
                image:
                    'https://github.com/igormidev/igorcurriculum/blob/master/art/igor_image.png?raw=true,',
                height: 220,
                width: width,
                fitWeb: BoxFitWeb.cover,
                onLoading: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant.withAlpha(
                      100,
                    ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              margin: const EdgeInsets.only(right: width + 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
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
                  Text(
                    '✅ Upwork top rated freelancer with 100% success rate (best 5% of platform)\n✅ Client experience is my number 1 priority',
                    style: TextStyle(
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
    final isSelected = provider.colorValue == color.value;

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
            // if (isSelected)
            //   Align(
            //     alignment: Alignment.bottomRight,
            //     child: CircleAvatar(
            //       radius: 10,
            //       backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            //       child: Icon(
            //         Icons.check,
            //         color: Theme.of(context).colorScheme.surface,
            //         size: 16,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

typedef TextSpanBuilder = TextSpan Function(TextStyle defaultStyle);

class WorkingWithMeAdvantages extends StatelessWidget {
  const WorkingWithMeAdvantages({super.key});

  @override
  Widget build(BuildContext context) {
    const delay = 800.0;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 370,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          Text(
            'How can i help you?',
            // '𝐇𝐨𝐰 𝐜𝐚𝐧 𝐈 𝐡𝐞𝐥𝐩 𝐲𝐨𝐮?',
            // style: Theme.of(context).textTheme.displaySmall,
            style: GoogleFonts.italiana(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            'Working with me, you will:',
            // '𝘞𝘰𝘳𝘬𝘪𝘯𝘨 𝘸𝘪𝘵𝘩 𝘮𝘦, 𝘺𝘰𝘶 𝘸𝘪𝘭𝘭:',
            // style: Theme.of(context).textTheme.bodyLarge,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Theme.of(context).colorScheme.outline,
              fontStyle: FontStyle.italic,
            ),
          ),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 750).milliseconds,
            textSpans: [
              (defaltStyle) {
                return TextSpan(
                  text: 'Ensure',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' that your user has an application that ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'runs smoothly',
                  style: defaltStyle.copyWith(
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' and is not constantly plagued by bugs.',
                  style: defaltStyle,
                );
              },
            ],
          ),
          const Divider(),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 1500).milliseconds,
            textSpans: [
              (defaltStyle) {
                return TextSpan(
                  text: 'Have ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'clean code',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: '. Easy to ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'maintain',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ', ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'modify',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' and ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'scale',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text:
                      '. No more starting the project at a great speed and after a while spending more time correcting code than writing new features.',
                  style: defaltStyle,
                );
              },
            ],
          ),
          const Divider(),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 2250).milliseconds,
            textSpans: [
              (defaltStyle) {
                return TextSpan(
                  text: 'Receive ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'constant updates',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: '. You will always know what I did ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'yesterday',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ', ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'today',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' and what I\'m going to do ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'tomorrow',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: '.',
                  style: defaltStyle,
                );
              },
            ],
          ),
          const Divider(),
          WorkingWithMeAdvantagesTile(
            animationDelay: (delay + 3000).milliseconds,
            textSpans: [
              (defaltStyle) {
                return TextSpan(
                  text: 'SAVE MONEY',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).colorScheme.primary,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' by working with someone who ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'doesn\'t screw around',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' just to get more paid hours. I have ',
                  style: defaltStyle,
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: 'zero interest',
                  style: defaltStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.scrim,
                    decoration: TextDecoration.underline,
                  ),
                );
              },
              (defaltStyle) {
                return TextSpan(
                  text: ' in making the project take longer than '
                      'necessary to deliver it with quality.',
                  style: defaltStyle,
                );
              },
            ],
          ),
        ],
      ),
    );
  }
}

class WorkingWithMeAdvantagesTile extends StatefulWidget {
  final Duration animationDelay;
  final List<TextSpanBuilder> textSpans;

  const WorkingWithMeAdvantagesTile({
    super.key,
    required this.textSpans,
    required this.animationDelay,
  });

  @override
  State<WorkingWithMeAdvantagesTile> createState() =>
      _WorkingWithMeAdvantagesTileState();
}

class _WorkingWithMeAdvantagesTileState
    extends State<WorkingWithMeAdvantagesTile> {
  bool willAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(widget.animationDelay, () {
      setState(() {
        willAnimate = true;
      });
    });
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
            child: RichText(
              text: TextSpan(
                children: widget.textSpans.map((e) {
                  return e(defaultStyle);
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
