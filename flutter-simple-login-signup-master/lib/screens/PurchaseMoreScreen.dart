import 'package:login_signup/components/PurchaseButton.dart';
import 'package:login_signup/utils/EAImages.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PurchaseMoreScreen extends StatefulWidget {
  const PurchaseMoreScreen({Key? key}) : super(key: key);

  @override
  _PurchaseMoreScreenState createState() => _PurchaseMoreScreenState();
}

class _PurchaseMoreScreenState extends State<PurchaseMoreScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: context.width(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: boxDecorationDefault(shape: BoxShape.circle),
                child: commonCachedNetworkImage(
                  event_ic_logo,
                  height: 180,
                ),
              ),
              22.height,
              Text('This is the Lite Version of the Event App', style: boldTextStyle(size: 22)),
              16.height,
              PurchaseButton(),
            ],
          ),
        ),
      ),
    );
  }
}
