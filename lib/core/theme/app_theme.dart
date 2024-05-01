import 'package:flutter/material.dart';

// All the colors used in the app are defined here
// This is to ensure that the colors are consistent throughout the app
// This is also to ensure that the colors can be easily changed
// Common styles like text styles, button styles, etc can also be defined here
abstract final class AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff6366F1),
        ),
        // App Text Theme is defines here
        textTheme: const TextTheme().apply(
          fontFamily: 'Inter',
        ),
      );
}

// This extension is used to access the theme and color scheme from the BuildContext
extension XAppTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
