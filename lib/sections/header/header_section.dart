import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant.withAlpha(100),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Igor miranda',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                  const FiveStarWidget(),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 10),
                    child: Text(
                      'Flutter Specialist',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ],
              ),
              Text(
                'Upwork top rated freelancer with 100% success rate (best 5% of platform)\nClient experience is my number 1 priority',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.outline,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
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
    Future.delayed(4.seconds, () {
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

typedef TextSpanBuilder = TextSpan Function(TextStyle defaultStyle);

class WorkingWithMeAdvantages extends StatelessWidget {
  const WorkingWithMeAdvantages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withAlpha(100),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          Text(
            '𝐇𝐨𝐰 𝐜𝐚𝐧 𝐈 𝐡𝐞𝐥𝐩 𝐲𝐨𝐮?',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            '𝘞𝘰𝘳𝘬𝘪𝘯𝘨 𝘸𝘪𝘵𝘩 𝘮𝘦, 𝘺𝘰𝘶 𝘸𝘪𝘭𝘭:',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          WorkingWithMeAdvantagesTile(
            animationDelay: 750.milliseconds,
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
            animationDelay: 1500.milliseconds,
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
            animationDelay: 2250.milliseconds,
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
            animationDelay: 3000.milliseconds,
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
