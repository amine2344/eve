import 'package:login_signup/screens/EANewsList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:login_signup/screens/EAHomeScreen.dart';
import 'package:login_signup/screens/settings_screen.dart';
import 'package:login_signup/screens/EAProfileScreen.dart';
import 'package:login_signup/utils/EAColors.dart';

import 'EASearchScreen.dart';

class EADashedBoardScreen extends StatefulWidget {
  final String? name;

  EADashedBoardScreen({this.name});

  @override
  EADashedBoardScreenState createState() => EADashedBoardScreenState();
}

class EADashedBoardScreenState extends State<EADashedBoardScreen> {
  int _selectedIndex = 1;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();
    _pages.add(SettingsScreen());
    _pages.add(EAHomeScreen(name: widget.name));
  //  _pages.add(EASearchScreen());
   // _pages.add(EANewsList());
    
    _pages.add(EAProfileScreen());
  }

  Widget _bottomTab() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primaryColor1,
      unselectedItemColor: black,
      items: <BottomNavigationBarItem>[
        
       // BottomNavigationBarItem(icon: Icon(LineIcons.search, size: 28), label: ''),
       // BottomNavigationBarItem(icon: Icon(LineIcons.newspaper, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.wrench, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.newspaper, size: 28), label: ''),
        BottomNavigationBarItem(icon: Icon(LineIcons.user, size: 28), label: ''),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    return Scaffold(
      bottomNavigationBar: _bottomTab(),
      body: Center(child: _pages.elementAt(_selectedIndex)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
