import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:google_fonts/google_fonts.dart';


@immutable
class TmoTheme extends ThemeExtension<TmoTheme> {
  const TmoTheme({
    this.primaryColor = const Color(0xFF6750A4),
    this.secondaryColor = const Color(0xFF385CA9),
    this.tertiaryColor = const Color(0xFF586400),
    this.neutralColor = const Color(0xFF8F9193),
  });

  final Color primaryColor, secondaryColor, tertiaryColor, neutralColor;

  ThemeData toThemeData() {
    final colorScheme = _scheme().toColorScheme(Brightness.dark);
    return _base(colorScheme).copyWith(brightness: colorScheme.brightness);
  }

  ThemeData _base(ColorScheme colorScheme) {
    final isLight = colorScheme.brightness == Brightness.light;
    final primaryTextTheme = GoogleFonts.oswaldTextTheme();
    final secondaryTextTheme = GoogleFonts.montserratTextTheme();
    final textTheme = primaryTextTheme.copyWith(
        displaySmall: secondaryTextTheme.displaySmall);

    return ThemeData(
      textTheme: textTheme,
      useMaterial3: true,
      extensions: [this],
      colorScheme: colorScheme,
      scaffoldBackgroundColor: isLight ? neutralColor : colorScheme.background,
      tabBarTheme: TabBarTheme(
          labelColor: colorScheme.onSurface,
          unselectedLabelColor: colorScheme.onSurface,
          indicator: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: colorScheme.primary, width: 2)))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colorScheme.secondaryContainer,
          foregroundColor: colorScheme.onSecondaryContainer),
      navigationRailTheme: NavigationRailThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface,
          selectedIconTheme:
              IconThemeData(color: colorScheme.onSecondaryContainer),
          indicatorColor: colorScheme.secondaryContainer),
      appBarTheme: AppBarTheme(
          toolbarHeight: 80,
          shadowColor: Colors.white24,
          elevation: 1.0,
          centerTitle: true,
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
      chipTheme: ChipThemeData(
          backgroundColor: isLight ? neutralColor : colorScheme.surface),
      bottomAppBarTheme: BottomAppBarTheme(
          color: isLight ? neutralColor : colorScheme.surface),
      iconTheme: IconThemeData(
        color: colorScheme.onPrimary,
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: Colors.amber,//isLight ? neutralColor : colorScheme.surface,
        elevation: 1.0,
        padding: const EdgeInsets.all(20.0),
        contentTextStyle: textTheme.bodyLarge,
      ),
      
      
    );
  }

  Scheme _scheme() {
    final base = CorePalette.of(primaryColor.value);
    final primary = base.primary;
    final secondary = CorePalette.of(secondaryColor.value).secondary;
    final tertiary = CorePalette.of(tertiaryColor.value).tertiary;
    final neutral = CorePalette.of(neutralColor.value).neutral;

//for light theme 40,100,90,10 background: 99,10 - for dar 80,20,30,90 bg: 10,90
    return Scheme(
      primary: primary.get(40),
      onPrimary: primary.get(100),
      primaryContainer: primary.get(90),
      onPrimaryContainer: primary.get(10),
      secondary: secondary.get(40),
      onSecondary: secondary.get(100),
      secondaryContainer: secondary.get(90),
      onSecondaryContainer: secondary.get(10),
      tertiary: tertiary.get(40),
      onTertiary: tertiary.get(100),
      tertiaryContainer: tertiary.get(90),
      onTertiaryContainer: tertiary.get(10),
      error: base.error.get(40),
      onError: base.error.get(100),
      errorContainer: base.error.get(90),
      onErrorContainer: base.error.get(10),
      background: neutral.get(99),
      onBackground: neutral.get(10),
      surface: neutral.get(99),
      onSurface: neutral.get(10),
      surfaceVariant: base.neutralVariant.get(90), //90
      onSurfaceVariant: base.neutralVariant.get(30), //30
      outline: base.neutralVariant.get(50), //light-50
      shadow: neutral.get(0),
      inverseSurface: neutral.get(20),
      inverseOnSurface: neutral.get(80),
      inversePrimary: primary.get(40),
    );
  }

  @override
  ThemeExtension<TmoTheme> copyWith({
    Color? primaryColor,
    Color? secondaryColor,
    Color? tertiaryColor,
    Color? neutralColor,
  }) =>
      TmoTheme(
          primaryColor: primaryColor ?? this.primaryColor,
          secondaryColor: secondaryColor ?? this.secondaryColor,
          tertiaryColor: tertiaryColor ?? this.tertiaryColor,
          neutralColor: neutralColor ?? this.neutralColor);

  @override
  TmoTheme lerp(covariant ThemeExtension<TmoTheme>? other, double t) {
    if (other is! TmoTheme) return this;
    return TmoTheme(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      secondaryColor: Color.lerp(secondaryColor, other.secondaryColor, t)!,
      tertiaryColor: Color.lerp(tertiaryColor, other.tertiaryColor, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!,
    );
  }
}

extension on Scheme {
  ColorScheme toColorScheme(Brightness brightness) {
    return ColorScheme(
        primary: Color(primary),
        onPrimary: Color(onPrimary),
        primaryContainer: Color(primaryContainer),
        onPrimaryContainer: Color(onPrimaryContainer),
        secondary: Color(secondary),
        onSecondary: Color(onSecondary),
        secondaryContainer: Color(secondaryContainer),
        onSecondaryContainer: Color(onSecondaryContainer),
        tertiary: Color(tertiary),
        onTertiary: Color(onTertiary),
        tertiaryContainer: Color(tertiaryContainer),
        onTertiaryContainer: Color(onTertiaryContainer),
        error: Color(error),
        onError: Color(onError),
        errorContainer: Color(errorContainer),
        onErrorContainer: Color(onErrorContainer),
        background: Color(background),
        onBackground: Color(onBackground),
        surface: Color(surface),
        onSurface: Color(onSurface),
        surfaceVariant: Color(surfaceVariant),
        onSurfaceVariant: Color(onSurfaceVariant),
        outline: Color(outline),
        shadow: Color(shadow),
        inverseSurface: Color(inverseSurface),
        inversePrimary: Color(inversePrimary),
        brightness: brightness);
  }
}
