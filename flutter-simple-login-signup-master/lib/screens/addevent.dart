import 'package:flutter/cupertino.dart';
import 'package:login_signup/screens/EventScreen.dart';
import 'package:login_signup/screens/settings_ui.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class AddEventPage extends StatefulWidget {
  final String? name;

  const AddEventPage({super.key, this.name});

  @override
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
    final Brightness brightness = CupertinoTheme.brightnessOf(context);

    return WillPopScope(
    onWillPop: () async {
      // Handle the back button press as needed
      // For example, you can show a confirmation dialog before allowing navigation.
      // If you want to navigate back without confirmation, simply return true.
       Navigator.of(context).pop();
       return false;// Return false to prevent navigation
    },
    child: const CupertinoPageScaffold(
      
      child:  CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            
           
           
            // The middle widget is visible in both collapsed and expanded states.
            middle: Text(' '),
            // When the "middle" parameter is implemented, the largest title is only visible
            // when the CupertinoSliverNavigationBar is fully expanded.
            largeTitle: Text('Add Event'),
          ),
          SliverFillRemaining(
            child:  Center(
              child:  EventScreen(),
            )
            
          ),
        ],
      ),
    ), );
  }
}