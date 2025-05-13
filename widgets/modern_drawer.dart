import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'profile.dart';
import '../main.dart';

class ModernDrawer extends StatelessWidget {
  const ModernDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: AppStyles.drawerWidth,
      backgroundColor: AppColors.drawer,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          const SizedBox(height: 8),
          _buildDrawerItem(
            context,
            icon: Icons.home_outlined,
            title: 'Home',
            onTap: () => _navigateToPage(context, const HomePage()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person_outline,
            title: 'Profile',
            onTap: () => _navigateToPage(context, const ProfilePage()),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 2,
              ),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/img/Profile.png'),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Firman Syahputra',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '058firmansyahputra@gmail.com',
            style: GoogleFonts.poppins(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: onTap,
      ),
    );
  }

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
