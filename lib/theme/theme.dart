import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.orange,
    primary: Colors.orange,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Colors.orange,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
  ),
  textTheme:  TextTheme(
    headlineMedium: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle(
      color: Color.fromARGB(251, 65, 65, 65),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
    ),
    labelSmall: TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      color: Colors.black.withOpacity(0.8),
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
     
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.yellow,
    primary: Colors.black54,
    brightness: Brightness.dark, // Устанавливаем яркость на темную
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium:  TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.italic,
    ),
    labelSmall: TextStyle(
      color: Colors.white70,
      fontWeight: FontWeight.w700,
      fontSize: 14,
    ),
    labelMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w700,
      fontSize: 16,
    ),
  ),
);
