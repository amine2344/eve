import 'dart:async';

import 'package:login_signup/screens/PurchaseMoreScreen.dart';
import 'package:login_signup/utils/EAapp_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

class EALocationScreen extends StatefulWidget {
  const EALocationScreen({Key? key}) : super(key: key);

  @override
  _EALocationScreenState createState() => _EALocationScreenState();
}

class _EALocationScreenState extends State<EALocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
        'Google Maps',
        center: true,
        backWidget: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            finish(context);
          },
        ),
      ),
      body: const PurchaseMoreScreen(),
    );
  }
}
