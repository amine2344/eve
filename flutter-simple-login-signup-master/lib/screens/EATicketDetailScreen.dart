import 'package:login_signup/utils/EAColors.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'EATodayTicketScreen.dart';
import 'EATomorrowTicketScreen.dart';

class EATicketDetailScreen extends StatefulWidget {
  const EATicketDetailScreen({super.key});

  @override
  _EATicketDetailScreenState createState() => _EATicketDetailScreenState();
}

class _EATicketDetailScreenState extends State<EATicketDetailScreen> {
  List<Tab> ticketTabs = [];

  final ticketTabPages = <Widget>[
    const EATodayTicketScreen(),
    const EATomorrowTicketScreen(),
  ];

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    ticketTabs.add(Tab(text: "${DateFormat('EEE').format(DateTime(now.day))} ${DateFormat('d MMM').format(DateTime.now())}".toUpperCase()));
    ticketTabs.add(Tab(text: "${DateFormat('EEE').format(DateTime(now.day + 1))} {DateFormat('d MMM').format(DateTime.now().add(Duration(days: 1)))} ".toUpperCase()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Ticket Details',
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: const Icon(Icons.arrow_back, color: white),
        ),
        actions: [
          Text('Clear', style: primaryTextStyle(color: white)).paddingAll(16),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: context.width(),
              child: Material(
                color: Colors.white,
                child: TabBar(
                  tabs: ticketTabs,
                  indicatorColor: primaryColor1,
                  labelColor: primaryColor1,
                  unselectedLabelColor: grey,
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: ticketTabPages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
