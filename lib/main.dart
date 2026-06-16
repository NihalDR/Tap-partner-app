import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const TapInvestApp());
}

class TapInvestApp extends StatelessWidget {
  const TapInvestApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Primary Brand Colors from the Design System
    const primaryColor = Color(0xFF006B2C); // Deep Green
    const secondaryColor = Color(0xFF40674A); // Medium Forest Green
    const backgroundColor = Color(0xFFF8F9FA); // Off-white
    const surfaceColor = Colors.white;

    return MaterialApp(
      title: 'Tap partner app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
          background: backgroundColor,
          surface: surfaceColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme.copyWith(
            bodyMedium: const TextStyle(color: Color(0xFF191C1D)),
            bodyLarge: const TextStyle(color: Color(0xFF191C1D)),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: surfaceColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: Color(0xFF3E4A3D),
          elevation: 12,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

