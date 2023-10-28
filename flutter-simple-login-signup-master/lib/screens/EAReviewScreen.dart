import 'package:login_signup/model/EAReviewModel.dart';
import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EAReviewScreen extends StatefulWidget {
  const EAReviewScreen({super.key});

  @override
  _EAReviewScreenState createState() => _EAReviewScreenState();
}

class _EAReviewScreenState extends State<EAReviewScreen> {
  List<EAReviewModel> list = reviewList();
  TextEditingController reviewController = TextEditingController();

  Widget slideLeftBackground() {
    return Container(
      color: primaryColor1,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Icon(Icons.arrow_back, color: Colors.white),
            10.width,
            const Icon(Icons.info_outline, color: Colors.white),
            20.width,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Reviews',
          backWidget: const Icon(Icons.close, color: white).onTap(() {
            finish(context);
          }),
          center: true),
      body: const PurchaseMoreScreen(),
    );
  }
}
