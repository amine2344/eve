import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/EAHomeScreen.dart';
import 'package:login_signup/screens/settings_screen.dart';
import 'package:login_signup/screens/EAProfileScreen.dart';
import 'package:login_signup/utils/EADataProvider.dart';


class EADashedBoardScreen extends StatefulWidget {
  final String? name;

  const EADashedBoardScreen({super.key, this.name});

  @override
  EADashedBoardScreenState createState() => EADashedBoardScreenState();
}

class EADashedBoardScreenState extends State<EADashedBoardScreen> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    init();
        const ListEvents(); 

    _pages.add(const Settings_i());
    _pages.add(EAHomeScreen(name: widget.name));
  //  _pages.add(EASearchScreen());
   // _pages.add(EANewsList());
    
    _pages.add(const EAProfileScreen());
  }

  Widget _bottomTab() {
    return WillPopScope(
     onWillPop: () async {
      print("backpressed button ");
      Navigator.pop(context);
      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        return const EADashedBoardScreen() ; 
      },));
      return true ; 
     }, child: 
    CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'events',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex, // Set the current index
        onTap: _onItemTapped, // Define a callback for when an item is tapped
      ),
      tabBuilder: (BuildContext context,  index ) {
        
        return CupertinoTabView(
          builder: (BuildContext context) {
            return Center(
              child: _pages.elementAt(_selectedIndex)
            );
          },
        );
      },
    ),
  );}


  

  void _onItemTapped(int index ) {
    setState(() {
      
      _selectedIndex = index  ;
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
    String hexcolor =  "#ed3269";
    return Scaffold(
      appBar: AppBar(
                    title:  Text('All Events', style: TextStyle(color: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.white),) ,

        backgroundColor: Color(int.parse(hexcolor.substring(1, 7), radix: 16) + 0xFF000000),
      ),
      bottomNavigationBar: _bottomTab(),
      body: Center(child: _pages.elementAt(_selectedIndex), 
            
      
      ),

        
        
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
