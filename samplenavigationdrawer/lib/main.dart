import 'package:flutter/material.dart';
import 'theme/app_theme.dart'; // Changed from drawer_app_theme.dart
import 'screens/home_screen.dart';

void main() {
  runApp(const DrawerNavApp());
}

class DrawerNavApp extends StatelessWidget {
  const DrawerNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Changed from DrawerAppTheme.theme
      home: const HomeScreen(),
    );
  }
}