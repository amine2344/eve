import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EAFollowersScreen.dart';
import 'EAFollowingScreen.dart';

class EAConnectionScreen extends StatefulWidget {
  final int? ind;

  const EAConnectionScreen({super.key, this.ind});

  @override
  _EAConnectionScreenState createState() => _EAConnectionScreenState();
}

class _EAConnectionScreenState extends State<EAConnectionScreen> {
  final connectionTabs = <Tab>[
    Tab(text: "FolLowers".toUpperCase()),
    Tab(text: "Following".toUpperCase()),
  ];
  final connectionTabPages = <Widget>[const EAFollowersScreen(), const EAFollowingScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Connections",
          backWidget: IconButton(
              onPressed: () {
                finish(context);
              },
              icon: const Icon(Icons.arrow_back, color: white))),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: context.width(),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  tabs: connectionTabs,
                  indicatorColor: primaryColor1,
                  labelColor: primaryColor1,
                  unselectedLabelColor: grey,
                  unselectedLabelStyle: const TextStyle(color: redColor),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: connectionTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
