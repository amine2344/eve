import 'package:login_signup/screens/EALocationScreen.dart';
import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class EAFilterScreen extends StatefulWidget {
  const EAFilterScreen({super.key});

  @override
  _EAFilterScreenState createState() => _EAFilterScreenState();
}

class _EAFilterScreenState extends State<EAFilterScreen> {
  double _value = 0.33;
  RangeValues _currentRangeValues = const RangeValues(20, 100);
  bool isCheck = false;
  int? isSelected;
  double ratingValue = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Filter',
        center: true,
        backWidget: IconButton(
          icon: const Icon(Icons.close, color: white),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        width: context.width(),
        height: 50,
        decoration: boxDecorationWithShadow(borderRadius: radius(24), gradient: const LinearGradient(colors: [primaryColor1, primaryColor2])),
        child: Text('Show 100+ Event'.toUpperCase(), style: primaryTextStyle(color: white, size: 16)),
      ).onTap(() {
        const EALocationScreen().launch(context);
      }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('When', style: boldTextStyle()).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            HorizontalList(
                itemCount: filterDateList.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecorationRoundedWithShadow(16, backgroundColor: isSelected == i ? primaryColor1 : white),
                    child: Text(filterDateList[i].name!, style: primaryTextStyle(color: isSelected == i ? white : black)),
                  ).onTap(() {
                    setState(() {
                      isSelected = i;
                    });
                  }, borderRadius: radius(16));
                }),
            16.height,
            Text('#Hashtag', style: boldTextStyle()).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            HorizontalList(
                itemCount: filterHashtagList.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(borderRadius: radius(16), backgroundColor: filterHashtagList[i].isSelected == true ? primaryColor1 : white),
                    child: Text(filterHashtagList[i].name!, style: primaryTextStyle(color: filterHashtagList[i].isSelected == true ? white : black)),
                  ).onTap(() {
                    filterHashtagList[i].isSelected = !filterHashtagList[i].isSelected;
                    log(filterHashtagList[i].isSelected);
                    setState(() {});
                  }, borderRadius: radius(16));
                }),
            16.height,
            Text('Ratings', style: boldTextStyle()).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            RatingBarWidget(
              onRatingChanged: (rating) {
                ratingValue = rating;
                setState(() {});
              },
              rating: ratingValue,
              allowHalfRating: true,
              itemCount: 5,
              size: 40,
              activeColor: primaryColor1,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star_half,
              defaultIconData: Icons.star_border_outlined,
            ).center(),
            16.height,
            createRichText(
              list: [
                TextSpan(text: 'Distance ', style: boldTextStyle()),
                TextSpan(text: '${_value.toStringAsFixed(0)} mil', style: boldTextStyle(color: primaryColor1)),
              ],
            ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            Slider(
              min: 0,
              max: 100,
              activeColor: primaryColor1,
              inactiveColor: grey.withOpacity(0.1),
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            16.height,
            createRichText(
              list: [
                TextSpan(text: 'Price ', style: boldTextStyle()),
                TextSpan(text: '\$${_currentRangeValues.start.toStringAsFixed(0)}-\$${_currentRangeValues.end.toStringAsFixed(0)}', style: boldTextStyle(color: primaryColor1)),
              ],
            ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: primaryColor1,
                inactiveTrackColor: grey.withOpacity(0.1),
                thumbColor: white,
                valueIndicatorTextStyle: const TextStyle(color: Colors.white),
              ),
              child: RangeSlider(
                values: _currentRangeValues,
                min: 0,
                max: 100,
                divisions: 10,
                labels: RangeLabels(_currentRangeValues.start.round().toString(), _currentRangeValues.end.round().toString()),
                onChanged: (RangeValues values) {
                  _currentRangeValues = values;

                  setState(() {});
                },
              ),
            ),
            16.height,
            Row(
              children: [
                Container(
                  height: 26,
                  width: 26,
                  decoration: boxDecorationWithRoundedCorners(boxShape: BoxShape.rectangle, border: Border.all(width: 0.1)),
                  child: Icon(
                    Icons.check,
                    color: isCheck ? primaryColor1 : white,
                  ),
                ).onTap(() {
                  isCheck = !isCheck;
                  setState(() {});
                }),
                16.width,
                Text('Only Free events', style: boldTextStyle()),
              ],
            ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12)
          ],
        ),
      ),
    );
  }
}
