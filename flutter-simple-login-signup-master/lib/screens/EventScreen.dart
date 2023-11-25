

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



enum RadioButtonOptions { op1, op2, op3 }


class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  _EventScreen createState() => _EventScreen();
}

class _EventScreen extends State<EventScreen> {
   final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventHostController = TextEditingController();
  final TextEditingController _eventDateController = TextEditingController();
  final TextEditingController _eventLocationController = TextEditingController();
  final TextEditingController _eventAboutController = TextEditingController();
  final TextEditingController _eventPhotoController = TextEditingController();
  
  
  Uint8List? _image ;
  void selectimage () async { 
    Uint8List img = await  _pickProfileImage(ImageSource.gallery);
    _image  = img ; 
  }
 Future _pickProfileImage(ImageSource source ) async {
    final ImagePicker imagepicker = ImagePicker() ; 
    XFile? file = await imagepicker.pickImage(source:  source ); 
    if (file!= null ){
      return await file.readAsBytes() ; 
    }
    print("no images selected ! ") ; 
}
Future<String> uploadImageToFirestore(Uint8List imageBytes) async {
  try {
    final firebaseStorageRef = FirebaseStorage.instance.ref().child(_eventNameController.text);
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
    Future add_new_event(String eventName , String eventHost ,String eventDate ,String eventLocation ,String eventAbout ,Uint8List eventPhoto) async { 
     _selectedCategorie =  segmentedControlOptions [selectedOptionIndex]; 

          String imageurl = await uploadImageToStorage(_eventNameController.text, eventPhoto);
          
       await FirebaseFirestore.instance.collection('new_event').add({
         'event_name' : eventName, 
            'event_date' :  eventDate,
            'event_location' :  eventLocation,
            'event_host' :  eventHost,
            'event_about' :  eventAbout,
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
 //     backgroundColor: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.white,

        
        body: SingleChildScrollView(
          child: 
    CupertinoFormSection(
   //   backgroundColor: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.white,
  header: const Center(
    child: Column(
      children: <Widget>[
        Text(
          'Please add the necessary fields',
          style: TextStyle(
            fontSize: 17.0, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
           // color: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.black, // Text color
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
    //color: settingUI.isDarkMode ? CupertinoColors.black : CupertinoColors.white, // Background color
    child: Column(
      children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                CupertinoTextFormFieldRow(
                  controller: _eventNameController,
                  placeholder: 'Event Name',
                  placeholderStyle: const TextStyle(
                    //color: settingUI.isDarkMode ? CupertinoColors.systemGrey : CupertinoColors.black, // Placeholder (hint) text color
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
                  placeholder: 'event Host',
                  placeholderStyle: const TextStyle(
                    //color: settingUI.isDarkMode ? CupertinoColors.white : CupertinoColors.black, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.person),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'event host is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventDateController,
                  placeholder: 'event Date',
                  placeholderStyle: const TextStyle(
                    //color: settingUI.isDarkMode ? CupertinoColors.white : CupertinoColors.black, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.calendar),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'event date is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventLocationController,
                  placeholder: 'event Location',
                  placeholderStyle: const TextStyle(
                    //color: settingUI.isDarkMode ? CupertinoColors.white : CupertinoColors.black, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.location),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'event location is required';
                    }
                    return null;
                  },
                ),
                CupertinoTextFormFieldRow(
                  controller: _eventAboutController,
                  placeholder: 'event About',
                  placeholderStyle: const TextStyle(
                    //color: settingUI.isDarkMode ? CupertinoColors.white : CupertinoColors.black, // Placeholder (hint) text color
                    fontWeight: FontWeight.bold, // Make it bold
                  ),
                  prefix: const Icon(CupertinoIcons.info),
                  maxLines: 3, // Adjust the number of lines as needed
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'event about is required';
                    }
                    return null;
                  },
                ),
                 CupertinoFormRow(
      prefix:  const Text(
        'Select Category:',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //color: settingUI.isDarkMode ? CupertinoColors.white : CupertinoColors.black,
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
    placeholder: 'Tap the camera icon to add your image',
    enabled: false,
    placeholderStyle: const TextStyle(
      //color: settingUI.isDarkMode ? CupertinoColors.white : CupertinoColors.black, // Placeholder (hint) text color
      fontWeight: FontWeight.bold, // Make it bold
    ),
    prefix: const Icon(CupertinoIcons.photo_camera),
    textAlign: TextAlign.center,
    validator: (value) {
      if (_image == null) {
        return 'event photo is required';
      }
      return null;
    },
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0), // Set border radius here
      border: Border.all(color: CupertinoColors.systemGrey), // You can adjust border properties
    ),
  ),
),

                const SizedBox(height: 20.0),
                CupertinoButton.filled(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, you can submit the event here
                      const CupertinoActivityIndicator(); 
                      add_new_event(_eventNameController.text.trim(), _eventHostController.text.trim(), _eventDateController.text.trim(), _eventLocationController.text.trim(), _eventAboutController.text.trim(), _image! );
                       showDialog(context: context, builder: (context) {
                          return   const    CupertinoAlertDialog(
                        title:  Text('Alert'),
                        content:  Text("Event added success", style: TextStyle(color: Colors.green),),
                        
                        
                          );});
                           Navigator.pop(context);
  
                    }
                  },
                  child: const Text('Submit Event'),
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



