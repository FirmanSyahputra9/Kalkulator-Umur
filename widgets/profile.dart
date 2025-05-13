import 'package:flutter/material.dart';
import 'modern_drawer.dart';
import 'widget.dart';
import 'constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: const ModernDrawer(),
      body: Container(
        decoration: AppStyles.gradientBackground,
        child: const BodyContent(),
      ),
    );
  }
}