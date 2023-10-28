import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EASelectHashtagScreen.dart';

class EASelectCityScreen extends StatefulWidget {
  const EASelectCityScreen({super.key});

  @override
  _EASelectCityScreenState createState() => _EASelectCityScreenState();
}

class _EASelectCityScreenState extends State<EASelectCityScreen> {
  TextEditingController searchController = TextEditingController();

  int selectCity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Select City"),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: boxDecorationWithShadow(backgroundColor: white, shadowColor: grey.withOpacity(0.3)),
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, size: 30),
                      hintText: 'Search city',
                    ),
                  ),
                ),
                Wrap(
                  runSpacing: 12,
                  spacing: 16,
                  children: List.generate(
                    cityList.length,
                    (index) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(cityList[index].image!, height: 250, width: context.width() * 0.43, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                                Container(
                                  height: 250,
                                  width: context.width() * 0.43,
                                  decoration: boxDecorationWithRoundedCorners(
                                    borderRadius: radius(16),
                                    gradient: selectCity == index
                                        ? LinearGradient(
                                            colors: [
                                              primaryColor1.withOpacity(0.4),
                                              primaryColor2.withOpacity(0.4),
                                            ],
                                          )
                                        : const LinearGradient(
                                            colors: [transparentColor, transparentColor],
                                          ),
                                  ),
                                ),
                                Icon(Icons.check_circle_outline, size: 30, color: selectCity == index ? white : transparentColor)
                              ],
                            ),
                            10.height,
                            Text(cityList[index].name!, style: boldTextStyle()).paddingLeft(8),
                            Text(cityList[index].subtitle!, style: secondaryTextStyle()).paddingLeft(8),
                          ],
                        ),
                      ).onTap(() {
                        selectCity = index;
                        setState(() {});
                      });
                    },
                  ),
                ).paddingAll(16),
                70.height,
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 4,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              width: context.width(),
              height: 50,
              decoration: boxDecorationWithShadow(borderRadius: radius(24), gradient: const LinearGradient(colors: [primaryColor1, primaryColor2])),
              child: Text('Next'.toUpperCase(), style: boldTextStyle(color: white, size: 18)),
            ).onTap(() {
              EASelectHashtagScreen(name: cityList[selectCity].name!).launch(context);
            }),
          ),
        ],
      ),
    );
  }
}
