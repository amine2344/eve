import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import 'PurchaseMoreScreen.dart';

class EAPurchaseScreen extends StatefulWidget {
  const EAPurchaseScreen({super.key});

  @override
  _EAPurchaseScreenState createState() => _EAPurchaseScreenState();
}

class _EAPurchaseScreenState extends State<EAPurchaseScreen> {
  TextEditingController applyController = TextEditingController();
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                centerTitle: true,
                pinned: true,
                backgroundColor: primaryColor1,
                title: Text('Purchase Detail', style: boldTextStyle(color: white)),
                expandedHeight: context.height() * 0.5,
                iconTheme: const IconThemeData(color: white),
                automaticallyImplyLeading: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              primaryColor1,
                              primaryColor2,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: context.height() * 0.413,
                        margin: const EdgeInsets.all(22),
                        decoration: boxDecorationWithShadow(backgroundColor: white, borderRadius: radius(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text("Quiet Clubbing VIP Heated RoofTop Party", style: boldTextStyle(size: 18)),
                                16.height,
                                Row(
                                  children: [
                                    const Icon(Icons.timelapse_rounded, size: 20),
                                    8.width,
                                    Text("SUN MAR.25-4:30 PM EST", style: primaryTextStyle()),
                                  ],
                                ),
                                16.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Entypo.location, size: 16),
                                    8.width,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Stage 48", style: secondaryTextStyle()),
                                        6.height,
                                        Text("605 W 48th street, Manhattan, 1008 ", style: secondaryTextStyle()),
                                      ],
                                    ).expand(),
                                  ],
                                ),
                                16.height,
                                Row(
                                  children: [
                                    const Icon(Icons.local_activity_outlined, size: 20),
                                    8.width,
                                    Text("2 vip Tickets - \$160", style: primaryTextStyle()),
                                  ],
                                ),
                              ],
                            ).paddingAll(16),
                            Container(
                              decoration: boxDecorationWithRoundedCorners(backgroundColor: grey.withOpacity(0.1)),
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Price', style: primaryTextStyle()),
                                  Text('\$160', style: boldTextStyle(color: primaryColor1)),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: const PurchaseMoreScreen(),
        ),
        bottomNavigationBar: commonButton(width: context.width(), btnText: "Get it").paddingAll(18));
  }
}
