import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EAConstants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PurchaseButton extends StatelessWidget {
  const PurchaseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'Purchase for more screen',
      color: primaryColor1,
      textStyle: boldTextStyle(color: Colors.white),
      shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
      onTap: () {
        launchUrl(purchaseURL);
      },
    );
  }
}
