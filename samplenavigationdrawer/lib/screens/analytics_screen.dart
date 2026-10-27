import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      drawer: const CustomDrawer(currentRouteIndex: 1),
      body: const Center(
        child: Text('Analytics Page Content', style: TextStyle(fontSize: 18, color: Colors.black54)),
      ),
    );
  }
}