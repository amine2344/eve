import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EAFilterScreen.dart';

class EASearchScreen extends StatefulWidget {
  const EASearchScreen({Key? key}) : super(key: key);

  @override
  EASearchScreenState createState() => EASearchScreenState();
}

class EASearchScreenState extends State<EASearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Search Events'),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PurchaseMoreScreen(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: boxDecorationRoundedWithShadow(20, backgroundColor: white),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Filter', style: primaryTextStyle()),
                8.width,
                const Icon(
                  SimpleLineIcons.equalizer,
                  size: 16,
                ),
              ],
            ),
          ).onTap(() {
            const EAFilterScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
          })
        ],
      ),
    );
  }
}
