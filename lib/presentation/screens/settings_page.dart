import 'package:flutter/material.dart';
import 'package:language_learning/data/utils/snack_bars.dart';
import 'package:language_learning/presentation/pages/invite_friend.dart';
import 'package:language_learning/presentation/screens/subscription_plan.dart';
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
                  name: 'Edit Profile',
                  imagePath: 'assets/user.png',
                  onTap: () => warningSnack(context, 'Oh snap', 'Coming soon'),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(
                  name: 'Settings',
                  imagePath: 'assets/settings.png',
                  onTap: () => warningSnack(context, 'Oh snap', 'Coming soon'),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(
                    name: 'My languages', imagePath: 'assets/translator.png'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(
                  name: 'Invite Friends',
                  imagePath: 'assets/invite.png',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const InviteFriendPage()));
                  },
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(name: 'Help', imagePath: 'assets/help.png'),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SettingsCard(
                  name: 'Get Access',
                  imagePath: 'assets/access.png',
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const SubscriptionPlan())),
                ),
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
