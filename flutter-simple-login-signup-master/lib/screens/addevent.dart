import 'package:flutter/cupertino.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/EventScreen.dart';

class AddEventPage extends StatefulWidget {
  final String? name;

  const AddEventPage({super.key, this.name});

  @override
  // ignore: library_private_types_in_public_api
  _AddEventPage createState() => _AddEventPage();
}

class _AddEventPage extends State<AddEventPage> {





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

    // ignore: deprecated_member_use
    return WillPopScope(child: 
    
    
     CupertinoPageScaffold(
      child:  CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            
           
           
            // The middle widget is visible in both collapsed and expanded states.
            middle: const Text(' '),
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
            largeTitle:  Text('Add Event', style: TextStyle(color: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.white),) ,
          ),
          const SliverFillRemaining(
            child:  Center(
              child:  EventScreen(),
            )
            
          ),
        ],
      ),
     )
     , onWillPop: 
     
     (){
      
      return  Future(() async {
        debugPrint("test");
        return true;
      },) ;

     });
   
  }
}