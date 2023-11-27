// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/cupertino_images.dart';
import 'package:login_signup/utils/EAColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class EAEventDetailScreen extends StatefulWidget {
  final String name;
  final String? hashTag;
  final String? attending;
  final String? price;
  final String image;
  final String host ; 
  final String about ; 
  final String date ; 
  final String location ; 
  const EAEventDetailScreen({super.key,required this.host, required this.location , required this.date , required this.name, this.hashTag, this.attending, this.price,required this.image, required this.about});

  @override
  _EAEventDetailScreenState createState() => _EAEventDetailScreenState();
}

Future<void> sendNotification(String deviceToken, String title, String body) async {
  final url = Uri.parse('https://fcm.googleapis.com/v1/projects/{auth-72203}/messages:send');
  const serverKey = 'be01c77dc2ae371acaf63571b0241948461a997e';
 try{
 await http.post(
        Uri.parse('https://fcm.googleapis.com/v1/projects/{auth-72203}/messages:send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": deviceToken,
          },
        ),
      );
    } catch (e) {
    }
      
}
class _EAEventDetailScreenState extends State<EAEventDetailScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String des = "why this party is for you";
  String des1 = "Let's play silent game.but this time you have to dance under the star white hundreds... ";
  bool isFriend = false;
  bool isFav = false;
  final PageController _pageController = PageController();
 
  @override
  Widget build(BuildContext context)  {
     List<String> imageList = [ 
    widget.image, 
    widget.image, 
    widget.image
  
  ];
    return WillPopScope(
     onWillPop: () async {
      Navigator.pop(context);
      return true ; 
     },
     child:  CupertinoPageScaffold(
     /*  navigationBar: const CupertinoNavigationBar(
        middle: Text('Event Details'),
      ), */
       child: Container(
        decoration:  BoxDecoration(
          image: DecorationImage(
            image:  settingUI.isDarkMode ?   const AssetImage("images/wallpaper_white.png") : const AssetImage("images/wallpaper_black.png") , 
            fit: BoxFit.cover,
          ),
        ),
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle: Text(""),
          ),
          SliverToBoxAdapter(
            child: CupertinoImageDotIndicator(
              pageController: pageController,
              images: imageList,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(0),
            sliver: SliverList(
              delegate:
              
             SliverChildListDelegate(
                [
                  

                  
   
   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Text(widget.hashTag!, style: secondaryTextStyle()).paddingOnly(left: 12, top: 8, bottom: 8),
              Text(widget.name, style: boldTextStyle()).paddingOnly(left: 12, bottom: 8),
             
              

              Row(
                children: [
                  const Icon(Icons.timelapse_rounded, size: 20),
                  8.width,
                  Text(widget.date.toString(), style: primaryTextStyle()),
                ],
              ).paddingOnly(left: 12, bottom: 8),
  
              Row(
                children: [
                  const Icon(
                    Icons.local_activity_outlined,
                    size: 20,
                  ),
                  8.width,
                  Text(widget.attending!, style: primaryTextStyle()),
                ],
              ).paddingOnly(left: 12, bottom: 8),
              16.height,
             /*  Container(
                color: grey.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Row(
                  children: [
                    Text('4.3', style: boldTextStyle(size: 30, color: primaryColor1)),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RatingBarWidget(
                              onRatingChanged: (rating) {},
                              rating: 4.3,
                              allowHalfRating: true,
                              itemCount: 5,
                              disable: true,
                              size: 16,
                              activeColor: primaryColor1,
                              filledIconData: Icons.star,
                              halfFilledIconData: Icons.star_half,
                              defaultIconData: Icons.star_border_outlined,
                            ),
                            8.width,
                            Text('1.3k', style: secondaryTextStyle()),
                          ],
                        ),
                        Text('241K Reviews', style: primaryTextStyle()),
                      ],
                    ).expand(),
                    Row(
                      children: [
                        const Icon(Icons.edit, color: primaryColor1),
                        Text('Write Review', style: primaryTextStyle(color: primaryColor1)),
                      ],
                    ).onTap(() {
                      const EAReviewScreen().launch(context, pageRouteAnimation: PageRouteAnimation.SlideBottomTop);
                    })
                  ],
                ),
              ), */
              16.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About'.toUpperCase(), style: boldTextStyle(color: grey)),
                  8.height,
                  Text(widget.about),
                  
                 /*  Row(
                    children: [Text("Detail", style: primaryTextStyle(color: primaryColor1)), 4.width, const Icon(Icons.arrow_forward_ios_outlined, size: 14, color: primaryColor1)],
                  ), */
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8),
              16.height,
              Text('Hosted by'.toUpperCase(), style: boldTextStyle(color: grey)).paddingOnly(left: 12, bottom: 8, top: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://assets.iqonic.design/old-themeforest-images/prokit/datingApp/Image.2.jpg"),
                    backgroundColor: white,
                    maxRadius: 30,
                  ),
                  12.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.host.toString(), style: boldTextStyle()),
                      Text('admin', style: secondaryTextStyle()),
                    ],
                  ).expand(),
                  /* IconButton(
                    onPressed: () {
                      isFriend = !isFriend;
                      setState(() {});
                    },
                    icon: isFriend == true ? Icon(Icons.person_remove, color: isFriend ? primaryColor1 : black) : Icon(Icons.person_add_alt_1, color: isFriend ? primaryColor1 : black),
                  ), */
                ],
              ).paddingOnly(left: 12, bottom: 16, top: 8, right: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Location'.toUpperCase(), style: boldTextStyle(color: grey)),
                 /*  Row(
                    children: [
                      Text("How to get there", style: primaryTextStyle(color: primaryColor1)),
                      4.width,
                      const Icon(Icons.arrow_forward_ios_outlined, size: 14, color: primaryColor1),
                    ],
                  ), */
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 /*  Text(widget.location.toString(), style: boldTextStyle()),
                  8.height, */
                  Row(
                    children: [
const Icon(Icons.map),
                  Text(widget.location.toString(), style: secondaryTextStyle()),
                  8.height,
                    ],
                  )
                  /* 
                  Text('3.5 near by', style: primaryTextStyle()), */
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
           
                Wrap(
  spacing: 8.0, // gap between adjacent chips
  runSpacing: 4.0, // gap between lines
  direction: Axis.horizontal, // main axis (rows or columns)
  alignment: WrapAlignment.center,
                children: [
                  Text("You've been invited to this event ".toUpperCase(), style: boldTextStyle(color: grey)),
                 /*  Row(
                    children: [
                      Text("How to get there", style: primaryTextStyle(color: primaryColor1)),
                      4.width,
                      const Icon(Icons.arrow_forward_ios_outlined, size: 14, color: primaryColor1),
                    ],
                  ), */
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),
             
              
              Wrap(
  spacing: 8.0, // gap between adjacent chips
  runSpacing: 4.0, // gap between lines
  direction: Axis.horizontal, // main axis (rows or columns)
  alignment: WrapAlignment.center,
  children: [
    CupertinoButton(
      color: CupertinoColors.systemRed,
      child: const Text('Decline', style: TextStyle(color: CupertinoColors.white, fontSize: 7)),
      onPressed: () {
        Navigator.pop(context);
        // Action when "Decline" is pressed
      },
    ),
    const SizedBox(width: 8),
    CupertinoButton(
      color: CupertinoColors.activeGreen,
      child: const Text('Accept', style: TextStyle(color: CupertinoColors.white, fontSize: 7)),
      onPressed: () {
        _launchURL();
        sendNotification("eQS6SOGDEFwAr1J-ypkAyI:APA91bEcMVs3MP-OUIogo2nqL9VIGFfQE-zULwQOTIJTBdf0ZJ-gZglWoUtAUtXaN3feQzcdjVVQxbdY_XMSvOyov92n7FHGXmWry5FEm4VNymO2MWKqGaRqMydv2H7bssKN8ga839YX", "Event accepted", "check user");
        // Action when "Accept" is pressed
      },
    ),
  ],
).paddingOnly(left: 12, bottom: 8),

              16.height,
             // Image.asset(event_ic_map, fit: BoxFit.cover, height: 200, width: context.width()),
              Text('Contact'.toUpperCase(), style: boldTextStyle(color: grey)).paddingOnly(left: 12, bottom: 8, top: 8),
              RichTextWidget(
                list: [
                  TextSpan(text: "Send us an email at", style: primaryTextStyle()),
                  TextSpan(text: " Contact@ravishevent.com", style: primaryTextStyle(color: primaryColor1)),
                  TextSpan(text: " or call us at", style: primaryTextStyle()),
                  TextSpan(text: " +971 52 866 1955 , +61 450 005 054", style: primaryTextStyle(color: primaryColor1)),
                ],
              ).paddingOnly(left: 12, bottom: 8, top: 8, right: 12),50.height,

               
             /*  Text('Similar Events'.toUpperCase(), style: boldTextStyle(color: grey)).paddingOnly(left: 12, bottom: 8, top: 8),
              HorizontalList(
                padding: const EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 12),
                itemCount: forYouList.length,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(

                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(forYouList[i].image!, height: 180, width: context.width() * 0.7, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                          const Positioned(right: 16, top: 16, child: Icon(Icons.favorite_border, color: white, size: 22)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          8.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(forYouList[i].hashtag!, style: secondaryTextStyle()),
                              Row(
                                children: [
                                  RatingBarWidget(
                                    onRatingChanged: (rating) {},
                                    rating: forYouList[i].rating!,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    size: 16,
                                    activeColor: primaryColor1,
                                    filledIconData: Icons.star,
                                    halfFilledIconData: Icons.star_half,
                                    defaultIconData: Icons.star_border_outlined,
                                  ),
                                  8.width,
                                  Text('1.3k', style: secondaryTextStyle()),
                                ],
                              ),
                            ],
                          ),
                          4.height,
                          Text(forYouList[i].name!, style: boldTextStyle()),
                          6.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Entypo.location, size: 16),
                                  8.width,
                                  Text(forYouList[i].add!, style: secondaryTextStyle()),
                                ],
                              ),
                              Text('${forYouList[i].distance}km', style: secondaryTextStyle(color: primaryColor1)),
                            ],
                          ),
                          6.height,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.local_activity_outlined, size: 16),
                              8.width,
                              Text(forYouList[i].attending!, style: secondaryTextStyle()),
                            ],
                          ),
                        ],
                      )
                    ],
                  ).paddingRight(8);
                },
              ) */
              
            ],
          ),
          
          
                ]

              ),
            ),
          ),
        ],
      ),
    ) ) ,
    );
  }
}

void _launchURL() async {
  final Uri url = Uri.parse('https://www.instagram.com/ravishdxb/');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}
