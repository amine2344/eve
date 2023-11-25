


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:login_signup/main.dart';
import 'package:login_signup/utils/color_picker.dart';
import 'package:adaptive_theme/adaptive_theme.dart';


enum RadioButtonOptions { op1, op2, op3 }


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool tileManager = settingUI.isDarkMode;
  var initialRadioChoice = RadioButtonOptions.op2;
  var checkBoxManager = true;
  var tile1 = false ;
  var tile2 = false ;
  // Color iconColor = Colors.black;
  double sliderCurVal = 20;
  var initialValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return 
    
  // ...
   Scaffold(
     
     
      body: SafeArea(
        child: settingsList(),
      ),
    );
  }

  Widget settingsList() {
    String hexcolor =  "#ed3269";
    
    return 
     Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image:  settingUI.isDarkMode ?   const AssetImage("images/wallpaper_white.png") : const AssetImage("images/wallpaper_black.png") , 
            fit: BoxFit.cover,
          ),
        ),
        child:
    ListView(
      
      
      
          
          children: [
            
            
             ListTile(
          title: const Text('Select Language'),
          leading: const Icon(CupertinoIcons.textformat_abc_dottedunderline),
          onTap:() => showLanguagePicker(context), 
        ),
            ListTile(
              title: const Text('Notification Push'),
              leading: const Icon(CupertinoIcons.bell),
              selectedTileColor: Color(int.parse(hexcolor.substring(1, 7), radix: 16) + 0xFF000000),
              trailing: Switch( value: tile1,
                onChanged: Notify,
              ),
              
            ),
           
           
            ListTile(
              title: const Text(' Dark Mode'),
              subtitle: const Text('Save your eyes'),
              leading: const Icon(CupertinoIcons.cloud_sun),
              trailing: Switch( value: tile2,
                onChanged: toggleDarkMode,
              ),
            ),
           
           
                ListTile(
                title: const Text('Change Password'),
                leading: const Icon(CupertinoIcons.lock_fill),
                onTap: () {
                  // Implement the change password logic here
                },
              ),
              ListTile(
                title: const Text('Change WhatsApp Number'),
                leading: const Icon(CupertinoIcons.phone_fill),
                onTap: () {
                  // Implement the change WhatsApp number logic here
                },
              ),
              ListTile(
                title: const Text('Change Email'),
                leading: const Icon(CupertinoIcons.mail),
                onTap: () {
                  // Implement the change email logic here
                },
              ),
            ListTile(
                          onTap: signout,
              title: const Text('log out'),
              
              leading: const Icon(CupertinoIcons.back),
            ),
          ],
        ));

       /*  SliderSection(
          slider: SliderTile(
            initialSliderValue: initialValue,
            onSliderChange: (value) {
              setState(() {
                initialValue = value;
              });
            },
            min: 0,
            max: 100,
          ),
          title: 'Slider',
        ), */
        /* RadioButtonSection(
          title: 'Radio Button',
          tiles: [
            RadioButton<RadioButtonOptions>(
              label: 'Monthly',
              value: RadioButtonOptions.op1,
              groupValue: initialRadioChoice,
              onChanged: onRadioChanged,
            ),
            RadioButton<RadioButtonOptions>(
              label: 'Yearly',
              value: RadioButtonOptions.op2,
              groupValue: initialRadioChoice,
              onChanged: onRadioChanged,
            ),
            RadioButton<RadioButtonOptions>(
              label: 'Life Time',
              value: RadioButtonOptions.op3,
              groupValue: initialRadioChoice,
              onChanged: onRadioChanged,
            ),
          ],
        ), */
      
    
  
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> toggleDarkMode(bool value) async {
    doSomething(value);
    setState(() {
      settingUI.isDarkMode ?      AdaptiveTheme.of(context).setDark() : AdaptiveTheme.of(context).setLight();
      tile2 =  !tile2; 
      // sets theme mode to dark
    });
    settingUI.callSetState();
  }  Future<void> Notify(bool value) async {
    doSomething(value);
    setState(() {

      tile1 =  !tile1; 
      // sets theme mode to dark
    });
    settingUI.callSetState();
  }

  Widget languageTrailing() {
    return PopupMenuButton(
      icon: Icon(Icons.arrow_drop_down,
          color: Theme.of(context).colorScheme.secondary),
      iconSize: 30,
      onSelected: doSomething,
      itemBuilder: (_) => supportedLanguages
          .map(
            (e) => PopupMenuItem(
              value: e,
              child: Text(e.name),
            ),
          )
          .toList(),
    );
  }

  final supportedLanguages = <LanguageData>[
    LanguageData('🇺🇸', 'English', 'en'),
    LanguageData('in', 'French', 'hi'),
  ];

  void doSomething(value) {
    ScaffoldMessenger.of(context).clearSnackBars();
   showDialog(context: context, builder: (context) {
          return     const CupertinoAlertDialog(
        title: Text('Done'),
          );}     
   
);
  
  
  }

  // ignore: avoid_positional_boolean_parameters
  void onTileChanged(bool? value) {
    doSomething(value);

    setState(() {
      tileManager = !tileManager;
    });
  }

  // ignore: avoid_positional_boolean_parameters
  void onCheckChanged(bool? value) {
    doSomething(value);

    setState(() {
      checkBoxManager = !checkBoxManager;
    });
  }

  void onRadioChanged(RadioButtonOptions? value) {
    doSomething(value);
    setState(() {
      if (value != null) {
        initialRadioChoice = value;
      }
    });
  }

  Future<void> colorPicker(List<Color> appColors, onColorChange) async {
    final status = await showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => MyAlertDialog(
            title: const Text('Pick Color'),
            content: SingleChildScrollView(
              child: ColorPicker(
                availableColors: appColors,
                pickerColor: Colors.deepOrangeAccent,
                onColorChanged: onColorChange,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text('Done'),
              ),
            ],
          ),
        ) ??
        false;
    if (status) {}
  }

  void onPrimaryColorChange(Color value) {
    setState(() {
      settingUI.primaryColor = value;
    });
    settingUI.callSetState();
  }

  void onAccentColorChange(Color value) {
    setState(() {
      settingUI.accentColor = value;
    });
    settingUI.callSetState();
  }

  void log_out(BuildContext context) {
  // Use Navigator to pop all routes on the stack
  Navigator.of(context).popUntil((route) => route.isFirst);
  // Push the login page route
  Navigator.pushReplacementNamed(context, 'login');
  }

  Function? signout() {
    FirebaseAuth.instance.signOut();
    return null;
  }
}


void showLanguagePicker(BuildContext context) {
  int selectedLanguageIndex = 0; // Initialize with the index of the current language
  showDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: const Text('Select Language'),
        content: SizedBox(
          height: 150, // Adjust the height as needed
          child: CupertinoPicker(
            itemExtent: 32.0,
            onSelectedItemChanged: (int index) {
              selectedLanguageIndex = index;
            },
            children: const <Widget>[
              Text('English'),
              Text('French'),
            ],
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: const Text('Save'),
            onPressed: () {
              // Save the selected language and apply it to your app
              // You can use the selectedLanguageIndex to determine the chosen language.
              // Implement your logic here.

              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}



class LanguageData {
  LanguageData(this.flag, this.name, this.languageCode);

  final String flag;
  final String name;
  final String languageCode;
}

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    required this.content,
    required this.title,
    this.actions,
    super.key,
  });

  final Widget title;
  final List<Widget>? actions;
  final Widget content;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Center(child: title),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).iconTheme.color!.withOpacity(0.1),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        content: content,
        actions: actions,
      );
}
/* 
List<Color> primaryColors = <Color>[
  Colors.red,
  Colors.pink,
  Colors.purple,
  Colors.deepPurple,
  Colors.blue,
  Colors.indigo,
  Colors.cyan,
  Colors.teal,
  Colors.orange,
  Colors.deepOrange,
  Colors.amber,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
  Colors.black,
];

List<Color> accentColors = <Color>[
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.blueAccent,
  Colors.indigoAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
  Colors.lightBlueAccent,
  Colors.amberAccent,
  const Color(0xFFFF7582),
]; */