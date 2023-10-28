// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_signup/components/signup_page.dart';
import 'package:login_signup/screens/EAFollowersScreen.dart';
import 'package:login_signup/screens/addevent.dart';




class MyProfile extends StatefulWidget {
  final String? name;

  const MyProfile({super.key, this.name});

  @override
  _MyProfile createState() => _MyProfile();


  
}

class _MyProfile extends State<MyProfile> {
 late String downloadURL = '';  
     
  bool isFormVisible = false;
  final user = FirebaseAuth.instance.currentUser ; 
  // document ID : 
  List<String> docIds = [

  ];

  late final  userInstagramId;
  // get documents : 
  Future getDocsId() async {
    await FirebaseFirestore.instance.collection("users").get().then((snapshot) => snapshot.docs.forEach((document) {
          docIds.add(document.reference.id);  
      
  }) );
  
  }
void _toggleFormVisibility() {
    setState(() {
      isFormVisible = !isFormVisible;
    });
  }

 @override
  void initState() {
    super.initState();
    getDocsId();
    
    
  }
  

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     
     
      body: 
    Padding(
  padding: const EdgeInsets.all(16.0),
  child: FutureBuilder<DocumentSnapshot>(
    future: FirebaseFirestore.instance.collection('users').doc(user!.uid).get(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CupertinoActivityIndicator(); // Show a loading indicator while fetching data.
      } else if (snapshot.hasError) { 
        return Text('Error: ${snapshot.error}');
      } else {
        if (snapshot.hasData && snapshot.data != null) {
          var userData = snapshot.data!.data() as Map<String, dynamic>;

            if (userData['admin'] == true ) {

            // admin page :  
            return 
            Center(child: 
            CupertinoButton.filled(
  onPressed: () {
    // Define the action to be performed when the button is pressed
    // For example, you can navigate to a new screen or perform some other task.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return AddEventPage();
      }),
    );
  },
  child: Text(
    
    'Add Event +',
    style: TextStyle(color: CupertinoColors.white), // Text color
  ),
)
,);

          }
          else  {
                 
                        
 
return ListView(
            children: <Widget>[
              // User's photos
              Container(
                width: 100,
                height: 100,
               child: 
               
               Image.network(
  userData['profilepic'] ?? 'https://png.pngtree.com/png-clipart/20210915/ourmid/pngtree-user-avatar-placeholder-black-png-image_3918427.jpg', // Placeholder image URL
  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    } else {
      return Center(
        child: CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
              : null,
        ),
      );
    }
  },
  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
    return Center(
      child: Text('Failed to load image'),
    );
  },
),

              ),
              SizedBox(height: 16),

              // Name (retrieved from Firestore)
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Name: ${userData['firstName']}'),
              ),
              // Gender (retrieved from Firestore)
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Instagram account: ${userData['instagramid']}'),
              ),
              // Location (retrieved from Firestore)
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Contact : ${userData['phone']}'),
              ),
              // Age (retrieved from Firestore)
              ListTile(
                leading: Icon(Icons.cake),
                title: Text('whatsapp number: ${userData['whatsappnumber']}'),
              ),
              // Profession (retrieved from Firestore)
              ListTile(
                leading: Icon(Icons.work),
                title: Text('Profession: ${userData['profession']}'),
              ),
              // Score (retrieved from Firestore)
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Score: '),
              ),
            ],
          );
          }
        } else {
          return Text('No data found');
        }
      }
    },
  ),
)
    );
  
  }
  
}

