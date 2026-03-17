import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:igorcurriculum/profile_page.dart';
import 'package:igorcurriculum/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
