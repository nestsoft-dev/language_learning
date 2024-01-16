import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:language_learning/presentation/screens/checks.dart';
import 'package:language_learning/presentation/screens/home.dart';
import 'package:language_learning/presentation/screens/profile.dart';
import 'package:language_learning/presentation/screens/stats.dart';

import '../../constant/constant.dart';

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _currentIndex = 0;
  void ontap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _screens = [HomePage(), CheckPage(), StatsPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: appBarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
              selectedIndex: _currentIndex,
              onTabChange: ontap,
              backgroundColor: appBarColor,
              gap: 8,
              color: Colors.grey,
              activeColor: Colors.white,
              tabBackgroundColor: onBoardingButton,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Iconsax.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Iconsax.check,
                  text: 'Tasks',
                ),
                GButton(
                  icon: Iconsax.status,
                  text: 'Stats',
                ),
                GButton(
                  icon: Iconsax.user,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    );
  }
}
