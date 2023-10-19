import 'package:flutter/cupertino.dart';
import 'package:login_signup/screens/EAForYouTabScreen.dart';
import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:login_signup/utils/EAColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EAFilterScreen.dart';

class EAHomeScreen extends StatefulWidget {
  final String? name;

  const EAHomeScreen({super.key, this.name});

  @override
  EAHomeScreenState createState() => EAHomeScreenState();
}

class EAHomeScreenState extends State<EAHomeScreen> {
  final _kTabs = <Tab>[
    const Tab(text: 'Incoming events'),
    const Tab(text: 'Past events'),
  ];

  final _kTabPages = <Widget>[
    const EAForYouTabScreen(),
    const PurchaseMoreScreen(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);

  }

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            
            border: Border(
              bottom: BorderSide(
                color: brightness == Brightness.light
                    ? CupertinoColors.black
                    : CupertinoColors.white,
              ),
            ),
            // The middle widget is visible in both collapsed and expanded states.
            middle: const Text('Events For You '),
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
            largeTitle: const Text('All Events'),
          ),
          const SliverFillRemaining(
            child:  Center(
              child:  EAForYouTabScreen(),
            )
            
          ),
        ],
      ),
    );
  }
}