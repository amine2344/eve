import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EASettingScreen extends StatefulWidget {
  const EASettingScreen({Key? key}) : super(key: key);

  @override
  _EASettingScreenState createState() => _EASettingScreenState();
}

class _EASettingScreenState extends State<EASettingScreen> {
  bool isNotificationOn = false;
  bool isLocationOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Setting',
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: const Icon(Icons.arrow_back, color: white),
        ),
      ),
      body: const PurchaseMoreScreen(),
      bottomNavigationBar: Text('Version 2.0', style: boldTextStyle(), textAlign: TextAlign.center).paddingBottom(16),
    );
  }
}
