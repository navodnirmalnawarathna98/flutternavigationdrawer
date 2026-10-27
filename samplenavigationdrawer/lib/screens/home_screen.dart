import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overview')),
      drawer: const CustomDrawer(currentRouteIndex: 0),
      body: const Center(
        child: Text('Welcome to Home Overview Page!', style: TextStyle(fontSize: 18, color: Colors.black54)),
      ),
    );
  }
}