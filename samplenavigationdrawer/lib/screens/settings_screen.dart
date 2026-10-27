import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      drawer: const CustomDrawer(currentRouteIndex: 3),
      body: const Center(
        child: Text('Application Settings', style: TextStyle(fontSize: 18, color: Colors.black54)),
      ),
    );
  }
}