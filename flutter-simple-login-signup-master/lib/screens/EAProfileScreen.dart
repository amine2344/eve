import 'package:flutter/material.dart';




import 'package:login_signup/model/user.dart';
import 'package:login_signup/utils/user_preferences.dart';
import 'package:login_signup/widget/appbar_widget.dart';
import 'package:login_signup/widget/button_widget.dart';
import 'package:login_signup/widget/numbers_widget.dart';
import 'package:login_signup/widget/profile_widget.dart';

class EAProfileScreen extends StatefulWidget {
  const EAProfileScreen({super.key});

  @override
  EAProfileScreenState createState() => EAProfileScreenState();
}

class EAProfileScreenState extends State<EAProfileScreen> {
  bool pinned = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }
 @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          const NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
