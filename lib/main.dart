import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:igorcurriculum/core/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:igorcurriculum/profile_page.dart';
import 'package:igorcurriculum/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebase();
  runApp(const MyApp());
}

Future<void> _initializeFirebase() async {
  try {
    await Firebase.initializeApp();
  } catch (error) {
    if (kDebugMode) {
      debugPrint('Firebase initialization skipped: $error');
    }
  }
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
            home: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > Constants.screenWidth) {
                  Constants.isMobileSize = false;
                  return const ProfilePage();
                } else {
                  Constants.isMobileSize = true;
                  return const ResponsiveScaledBox(
                    width: 636,
                    child: ProfilePage(),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
