import 'package:flutter/material.dart';

import '../screens/analytics_screen.dart';
import '../screens/feedback_form_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

class CustomDrawer extends StatelessWidget {
  final int currentRouteIndex;

  const CustomDrawer({super.key, required this.currentRouteIndex});

  void _navigateTo(BuildContext context, int index, Widget page) {
    Navigator.pop(context); // Close Drawer
    if (currentRouteIndex != index) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, anim1, anim2) => page,
          transitionsBuilder: (context, anim, secondaryAnim, child) {
            return FadeTransition(opacity: anim, child: child);
          },
          transitionDuration: const Duration(milliseconds: 200),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00B894), Color(0xFF0984E3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.school, size: 36, color: Color(0xFF00B894)),
            ),
            accountName: const Text('Campus Admin Portal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            accountEmail: const Text('version 2.0.1', style: TextStyle(color: Colors.white70)),
          ),
          const SizedBox(height: 8),
          _DrawerItem(
            icon: Icons.dashboard_outlined,
            selectedIcon: Icons.dashboard,
            title: 'Overview',
            isSelected: currentRouteIndex == 0,
            onTap: () => _navigateTo(context, 0, const HomeScreen()),
          ),
          _DrawerItem(
            icon: Icons.analytics_outlined,
            selectedIcon: Icons.analytics,
            title: 'Analytics',
            isSelected: currentRouteIndex == 1,
            onTap: () => _navigateTo(context, 1, const AnalyticsScreen()),
          ),
          _DrawerItem(
            icon: Icons.rate_review_outlined,
            selectedIcon: Icons.rate_review,
            title: 'Feedback Form',
            isSelected: currentRouteIndex == 2,
            onTap: () => _navigateTo(context, 2, const FeedbackFormScreen()),
          ),
          _DrawerItem(
            icon: Icons.settings_outlined,
            selectedIcon: Icons.settings,
            title: 'Settings',
            isSelected: currentRouteIndex == 3,
            onTap: () => _navigateTo(context, 3, const SettingsScreen()),
          ),
          const Spacer(),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Powered by Flutter M3',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.selectedIcon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: isSelected ? const Color(0xFF00B894).withOpacity(0.12) : Colors.transparent,
        leading: Icon(isSelected ? selectedIcon : icon, color: isSelected ? const Color(0xFF00B894) : Colors.grey[700]),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFF00B894) : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}