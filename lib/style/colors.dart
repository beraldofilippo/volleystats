import 'package:flutter/material.dart';

class ThemeColors {

  static MaterialColor getSwatch() {
    return MaterialColor(_swatch[800].value, _swatch);
  }

  static const Map<int, Color> _swatch = const <int, Color> {
    50: const Color(0xFFFAE4E4),
    100: const Color(0xFFF3BCBC),
    200: const Color(0xFFEB8F8F),
    300: const Color(0xFFE26262),
    400: const Color(0xFFDC4141),
    500: const Color(0xFFD61F1F),
    600: const Color(0xFFD11B1B),
    700: const Color(0xFFCC1717),
    800: const Color(0xFFC61212),
    900: const Color(0xFFBC0A0A)
  };
}