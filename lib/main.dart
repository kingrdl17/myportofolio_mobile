import 'package:dynamic_color/dynamic_color.dart';
import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportofolio_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        final lightScheme = lightDynamic == null
            ? ColorScheme.fromSeed(seedColor: Colors.indigo)
            : _toMaterialColorScheme(lightDynamic, Brightness.light);
        final darkScheme = darkDynamic == null
            ? ColorScheme.fromSeed(
                seedColor: Colors.indigo,
                brightness: Brightness.dark,
              )
            : _toMaterialColorScheme(darkDynamic, Brightness.dark);
        final googleTextTheme = GoogleFonts.googleSansFlexTextTheme();
        final lightBaseTheme = ThemeData(
          colorScheme: lightScheme,
          typography: Typography.material2021(colorScheme: lightScheme),
          useMaterial3: true,
          textTheme: _toMaterialTextTheme(googleTextTheme),
        );
        final darkBaseTheme = ThemeData(
          colorScheme: darkScheme,
          typography: Typography.material2021(colorScheme: darkScheme),
          useMaterial3: true,
          textTheme: _toMaterialTextTheme(googleTextTheme),
        );

        return MaterialApp(
          title: 'Clay\'s Portfolio',
          theme: lightBaseTheme,
          darkTheme: darkBaseTheme,
          themeMode: ThemeMode.system,
          home: const MyHomePage(),
        );
      },
    );
  }
}

ColorScheme _toMaterialColorScheme(dynamic scheme, Brightness brightness) {
  return ColorScheme.fromSeed(
    seedColor: scheme.primary,
    brightness: brightness,
  ).copyWith(
    primary: scheme.primary,
    onPrimary: scheme.onPrimary,
    primaryContainer: scheme.primaryContainer,
    onPrimaryContainer: scheme.onPrimaryContainer,
    secondary: scheme.secondary,
    onSecondary: scheme.onSecondary,
    secondaryContainer: scheme.secondaryContainer,
    onSecondaryContainer: scheme.onSecondaryContainer,
    tertiary: scheme.tertiary,
    onTertiary: scheme.onTertiary,
    tertiaryContainer: scheme.tertiaryContainer,
    onTertiaryContainer: scheme.onTertiaryContainer,
    error: scheme.error,
    onError: scheme.onError,
    errorContainer: scheme.errorContainer,
    onErrorContainer: scheme.onErrorContainer,
    outline: scheme.outline,
    outlineVariant: scheme.outlineVariant,
    shadow: scheme.shadow,
    surface: scheme.surface,
    onSurface: scheme.onSurface,
    surfaceContainerHighest: scheme.surfaceContainerHighest,
    onSurfaceVariant: scheme.onSurfaceVariant,
    inverseSurface: scheme.inverseSurface,
    onInverseSurface: scheme.onInverseSurface,
    inversePrimary: scheme.inversePrimary,
    surfaceTint: scheme.surfaceTint,
    scrim: scheme.scrim,
  );
}

TextTheme _toMaterialTextTheme(dynamic theme) {
  return TextTheme(
    displayLarge: theme.displayLarge,
    displayMedium: theme.displayMedium,
    displaySmall: theme.displaySmall,
    headlineLarge: theme.headlineLarge,
    headlineMedium: theme.headlineMedium,
    headlineSmall: theme.headlineSmall,
    titleLarge: theme.titleLarge,
    titleMedium: theme.titleMedium,
    titleSmall: theme.titleSmall,
    bodyLarge: theme.bodyLarge,
    bodyMedium: theme.bodyMedium,
    bodySmall: theme.bodySmall,
    labelLarge: theme.labelLarge,
    labelMedium: theme.labelMedium,
    labelSmall: theme.labelSmall,
  );
}
