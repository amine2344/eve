import 'package:login_signup/components/EAProfileTopComponent.dart';
import 'package:login_signup/screens/EANotificationScreen.dart';
import 'package:login_signup/screens/EARewardScreen.dart';
import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:login_signup/utils/EAImages.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EAConnectionScreen.dart';
import 'EAIndexScreen.dart';
import 'EASettingScreen.dart';


import 'package:flutter/cupertino.dart';

import 'package:login_signup/model/user.dart';
import 'package:login_signup/utils/user_preferences.dart';
import 'package:login_signup/widget/appbar_widget.dart';
import 'package:login_signup/widget/button_widget.dart';
import 'package:login_signup/widget/numbers_widget.dart';
import 'package:login_signup/widget/profile_widget.dart';

class EAProfileScreen extends StatefulWidget {
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
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
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
          NumbersWidget(),
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
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
