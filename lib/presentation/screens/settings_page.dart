import 'package:flutter/material.dart';
import 'package:language_learning/presentation/pages/invite_friend.dart';
import 'package:language_learning/presentation/widgets/appbar.dart';
import 'package:language_learning/presentation/widgets/settings_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(
            text: 'Settings',
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                SettingsCard(
                    name: 'Edit Profile', imagePath: 'assets/italy.png'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(name: 'Settings', imagePath: 'assets/italy.png'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(
                    name: 'My languages', imagePath: 'assets/italy.png'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(
                  name: 'Invite Friends',
                  imagePath: 'assets/italy.png',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const InviteFriendPage()));
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(name: 'Help', imagePath: 'assets/italy.png'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(name: 'Get Access', imagePath: 'assets/italy.png'),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
