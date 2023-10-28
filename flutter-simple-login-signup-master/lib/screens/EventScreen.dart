

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keepsettings/keepsettings.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/utils/color_picker.dart';
import 'package:adaptive_theme/adaptive_theme.dart';


enum RadioButtonOptions { op1, op2, op3 }


class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  _EventScreen createState() => _EventScreen();
}

class _EventScreen extends State<EventScreen> {
   final _formKey = GlobalKey<FormState>();
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _eventHostController = TextEditingController();
  TextEditingController _eventDateController = TextEditingController();
  TextEditingController _eventLocationController = TextEditingController();
  TextEditingController _eventAboutController = TextEditingController();
  TextEditingController _eventPhotoController = TextEditingController();
  
  
  Uint8List? _image ;
  void selectimage () async { 
    Uint8List img = await  _pickProfileImage(ImageSource.gallery);
    _image  = img ; 
  }
 Future _pickProfileImage(ImageSource source ) async {
    final ImagePicker _imagepicker = ImagePicker() ; 
    XFile? file = await _imagepicker.pickImage(source:  source ); 
    if (file!= null ){
      return await file.readAsBytes() ; 
    }
    print("no images selected ! ") ; 
}
Future<String> uploadImageToFirestore(Uint8List imageBytes) async {
  try {
    final firebaseStorageRef = FirebaseStorage.instance.ref().child("${_eventNameController.text}");
    // You can change the 'profile_images' folder to your desired folder name.

    // Convert Uint8List to PNG image
    final metadata = SettableMetadata(contentType: 'image/png');

    // Upload the file with specified metadata
    await firebaseStorageRef.putData(imageBytes, metadata);

    final imageUrl = await firebaseStorageRef.getDownloadURL();
    return imageUrl;
  } catch (e) {
    debugPrint('Failed to upload image to Firestore: $e');
    return '';
  }
}

  int selectedOptionIndex = 0;
  final Map<int, String> segmentedControlOptions = {
    0: 'Category 1',
    1: 'Category 2',
    2: 'Category 3',
    3: 'Category 4',
  };

  String? _selectedCategorie; 


              final FirebaseStorage _storage = FirebaseStorage.instance;

   Future<String> uploadImageToStorage(String fileName, Uint8List file) async {
  try {
    final Reference ref = FirebaseStorage.instance.ref().child('$fileName.png');
    // Assuming the provided 'fileName' is already the filename without an extension.

    final metadata = SettableMetadata(contentType: 'image/png');

    final TaskSnapshot taskSnapshot = await ref.putData(file, metadata);
    final downloadUrl = await taskSnapshot.ref.getDownloadURL();

    return downloadUrl;
  } catch (e) {
    debugPrint('Failed to upload image to Firestore: $e');
    return ''; // Return an appropriate value or handle the error according to your needs.
  }
}
    Future add_new_event(String event_name , String event_host ,String event_date ,String event_location ,String event_about ,Uint8List event_photo) async { 
     _selectedCategorie =  segmentedControlOptions [selectedOptionIndex]; 

          String imageurl = await uploadImageToStorage("${_eventNameController.text}", event_photo);
          
       await FirebaseFirestore.instance.collection('new_event').add({
         'event_name' : event_name, 
            'event_date' :  event_date,
            'event_location' :  event_location,
            'event_host' :  event_host,
            'event_about' :  event_about,
           // 'gender' :  , 
           // 'city' :  ,
            'event_photo' :  imageurl,
            'event_cat' :  _selectedCategorie,
            
            



        });
        
}
  @override
  Widget build(BuildContext context) {
    return 
   SafeArea(
      child: Scaffold(

        
        body: SingleChildScrollView(
          child: 
    CupertinoFormSection(
      backgroundColor: Colors.white,
  header: Center(
    child: Column(
      children: <Widget>[
        Text(
          'Please add the necessary fields',
          style: TextStyle(
            fontSize: 17.0, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
            color: CupertinoColors.systemGrey, // Text color
          ),
        ),
      ],
    ),

    ),
        children: 
        
        <Widget>[
          ClipRRect(
  borderRadius: BorderRadius.circular(12.0), // Adjust the radius as needed
  child: Container(
    color: Colors.white, // Background color
    child: Column(
      children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CupertinoTextFormFieldRow(
                  controller: _eventNameController,
                  placeholder: 'Event Name',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.news),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Event name is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventHostController,
                  placeholder: 'Event Host',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.person),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Event host is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventDateController,
                  placeholder: 'Event Date',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.calendar),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Event date is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventLocationController,
                  placeholder: 'Event Location',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.location),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Event location is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventAboutController,
                  placeholder: 'Event About',
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.info),
                  maxLines: 3, // Adjust the number of lines as needed
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Event about is required';
                    }
                    return null;
                  },
                ),
                 CupertinoFormRow(
      prefix: const Text(
        'Select Category:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: CupertinoColors.systemGrey,
        ),
      ),
      child: CupertinoSegmentedControl<int>(
        children: const {
          0: Text('Category 1'),
          1: Text('Category 2'),
          2: Text('Category 3'),
          3: Text('Category 4'),
        },
        groupValue: selectedOptionIndex,
        onValueChanged: (int newValue) {
          setState(() {
            selectedOptionIndex = newValue;
          });
        },
      ),
    ),
                GestureDetector(
  onTap: selectimage,
  child: CupertinoTextFormFieldRow(
    controller: _eventPhotoController,
    placeholder: 'tap the camera icon to add your image ',
    enabled: false ,
    placeholderStyle: TextStyle(

      color: CupertinoColors.systemGrey, // Placeholder (hint) text color
      fontWeight: FontWeight.bold, // Make it bold
    ),
    prefix: const Icon(CupertinoIcons.photo_camera),
    validator: (value) {
      if (_image == null) {
        return 'Event photo is required';
      }
      return null;
    },
  ),
),
                const SizedBox(height: 20.0),
                CupertinoButton.filled(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, you can submit the event here
                      add_new_event(_eventNameController.text.trim(), _eventHostController.text.trim(), _eventDateController.text.trim(), _eventLocationController.text.trim(), _eventAboutController.text.trim(), _image! );
                      
                    }
                  },
                  child: Text('Submit Event'),
                ),
              ],
            ),
          ),
          
        ],
     
     
    
    ),
  ),
          ),
        ],) , ) , ) , ) ;

  }
  
  
}



