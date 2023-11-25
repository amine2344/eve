import 'package:flutter/cupertino.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/EAForYouTabScreen.dart';
import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/utils/EADataProvider.dart';


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
    //    ListEvents(); 
    const ListEvents(); 

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
            middle: const Text(' '),
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
                       largeTitle:  Text('All Events', style: TextStyle(color: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.white),) ,

          ),
           SliverFillRemaining(
            child:  Center(
              child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image:  settingUI.isDarkMode ? const AssetImage("images/wallpaper_black.png") : const AssetImage("images/wallpaper_white.png") , 
            fit: BoxFit.cover,
          ),
        ),
         child: const EAForYouTabScreen(),
            )),
            
          ),
        ],
      ),
    );
  }
}