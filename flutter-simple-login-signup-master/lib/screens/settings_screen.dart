import 'package:flutter/cupertino.dart';
import 'package:login_signup/screens/settings_ui.dart';


class Settings_i extends StatefulWidget {
  final String? name;

  const Settings_i({super.key, this.name});

  @override
  _Settings_i createState() => _Settings_i();
}

class _Settings_i extends State<Settings_i> {





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
            largeTitle: const Text('Settings'),
          ),
          const SliverFillRemaining(
            child:  Center(
              child:  SettingsScreen(),
            )
            
          ),
        ],
      ),
    );
  }
}