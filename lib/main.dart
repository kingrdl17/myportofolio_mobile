import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportofolio_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final lightScheme =
            lightDynamic ?? ColorScheme.fromSeed(seedColor: Colors.indigo);
        final darkScheme =
            darkDynamic ??
            ColorScheme.fromSeed(
              seedColor: Colors.indigo,
              brightness: Brightness.dark,
            );
        final lightBaseTheme = ThemeData(
          colorScheme: lightScheme,
          typography: Typography.material2021(colorScheme: lightScheme),
          useMaterial3: true,
        );
        final darkBaseTheme = ThemeData(
          colorScheme: darkScheme,
          typography: Typography.material2021(colorScheme: darkScheme),
          useMaterial3: true,
        );

        return MaterialApp(
          title: 'Clay\'s Portfolio',
          theme: lightBaseTheme.copyWith(
            textTheme: GoogleFonts.googleSansFlexTextTheme(
              lightBaseTheme.textTheme,
            ),
          ),
          darkTheme: darkBaseTheme.copyWith(
            textTheme: GoogleFonts.googleSansFlexTextTheme(
              darkBaseTheme.textTheme,
            ),
          ),
          themeMode: ThemeMode.system,
          home: const MyHomePage(),
        );
      },
    );
  }
}
