import 'package:babel_text/babel_text.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:igorcurriculum/profile_page.dart';
import 'package:igorcurriculum/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BabelTextSettings.instance.defaultSytleMapping({
    '<b>': (context, currentStyle) =>
        currentStyle.copyWith(fontWeight: FontWeight.bold),
    '<u>': (context, currentStyle) =>
        currentStyle.copyWith(decoration: TextDecoration.underline),
    '<i>': (context, currentStyle) =>
        currentStyle.copyWith(fontStyle: FontStyle.italic),
    '<pC>': (context, currentStyle) =>
        currentStyle.copyWith(color: Theme.of(context).colorScheme.primary),
    '<sC>': (context, currentStyle) =>
        currentStyle.copyWith(color: Theme.of(context).colorScheme.secondary),
    '<tC>': (context, currentStyle) =>
        currentStyle.copyWith(color: Theme.of(context).colorScheme.tertiary),
    '<gC>': (context, currentStyle) =>
        currentStyle.copyWith(color: Theme.of(context).colorScheme.outline),
    '<soft>': (context, currentStyle) => currentStyle.copyWith(
          color: (currentStyle.color ?? Theme.of(context).colorScheme.onSurface)
              .withAlpha(190),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
        ),
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final state = context.watch<ThemeProvider>();
          final scheme = ColorScheme.fromSeed(
            seedColor: Color(state.colorValue),
            brightness: state.brightness,
          );
          return MaterialApp(
            title: 'Igor Curriculum',
            scrollBehavior:
                const MaterialScrollBehavior().copyWith(scrollbars: false),
            theme: ThemeData(
              colorScheme: scheme,
              useMaterial3: true,
            ),
            home: LayoutBuilder(
              builder: (context, constraints) {
                Constants.isMobileSize =
                    constraints.maxWidth <= Constants.desktopBreakpoint;
                return const ProfilePage();
              },
            ),
          );
        },
      ),
    );
  }
}
