import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/MyProfile.dart';


class EAProfileScreen extends StatefulWidget {
  final String? name;

  const EAProfileScreen({super.key, this.name});

  @override
  _EAProfileScreen createState() => _EAProfileScreen();
}

class _EAProfileScreen extends State<EAProfileScreen> {





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
            middle: const Text(' '),
            
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.

                        largeTitle:  Text('Profile', style: TextStyle(color: settingUI.isDarkMode ? Colors.black : Colors.white),) ,



            
          ),
          const SliverFillRemaining(
            
            child:  Center(
              child:  MyProfile(),
            )
            
          ),
        
        ],
        
      ),
    );
  }
}