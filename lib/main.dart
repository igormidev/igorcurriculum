import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:igorcurriculum/profile_page.dart';
import 'package:igorcurriculum/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
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
            theme: ThemeData(
              colorScheme: scheme,
              useMaterial3: true,
            ),
            builder: (context, child) {
              if (Constants().isMobile == false) {
                return child!;
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ResponsiveScaledBox(
                    width: 600,
                    child: child!,
                  ),
                );
              }
            },
            home: const ProfilePage(),
          );
        },
      ),
    );
  }
}
