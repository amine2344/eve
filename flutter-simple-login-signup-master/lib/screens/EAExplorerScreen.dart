import 'package:login_signup/model/EAForYouModel.dart';
import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:login_signup/utils/EADataProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EAExplorerScreen extends StatefulWidget {
  @override
  EAExplorerScreenState createState() => EAExplorerScreenState();
}

class EAExplorerScreenState extends State<EAExplorerScreen> {
  List<EAForYouModel> explorerList = getMayKnowData();

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
    return const PurchaseMoreScreen();
  }
}
