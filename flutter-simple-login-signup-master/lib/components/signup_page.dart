


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/components/common/page_heading.dart';

import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
import 'package:login_signup/components/login_page.dart';

class SignupPage extends StatefulWidget {
  final  Function()? onTap;
  const SignupPage({super.key, required  this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  final _signupFormKey = GlobalKey<FormState>();
  String? mtoken = " ";
  
  late AndroidNotificationChannel channel;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;




  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
 final TextEditingController _lastnameController = TextEditingController();
 final TextEditingController _whatsappController = TextEditingController();
 final TextEditingController _instaController = TextEditingController();
 // ignore: non_constant_identifier_names
 final TextEditingController _ProfessionController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _contactController.dispose();
    _nameController.dispose();
    _lastnameController.dispose();
    _whatsappController.dispose();
    _ProfessionController.dispose();
    _instaController.dispose();
    super.dispose();
  }
   @override
  void initState() {
    super.initState();

   
   
   
  }
   void getTokenFromFirestore() async {

  }
  



  void getToken() async {
    await FirebaseMessaging.instance.getToken().then(
            (token) {
              setState(() {
                mtoken = token;
              });


            }
    );
  }


 
 
 
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
}
Future<String> uploadImageToFirestore(Uint8List imageBytes) async {
  try {
    final firebaseStorageRef = FirebaseStorage.instance.ref().child('profile_images/${_emailController.text.trim()}.png');
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


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        
        body: SingleChildScrollView(
          
          child: Form(
            key: _signupFormKey,
            child: Column(
              children: [
                
                Container(
                  decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back1.png"),
            fit: BoxFit.cover,
          ),
        ),
                  child: Column(
                    children: [
                    
                      const PageHeading(title: 'Sign-up',),
                      SizedBox(
                        width: 130,
                        height: 130,
                        
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 22, 22, 22),
                          backgroundImage: _image != null ? MemoryImage(_image!) : null,
                          
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: GestureDetector(
                                  onTap: selectimage,
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade400,
                                      border: Border.all(color: Colors.white, width: 3),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_sharp,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          controller: _nameController,
                          labelText: 'First Name',
                          
                          hintText: 'Your first name',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Name field is required!';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),
                        CustomInputField(
                          controller: _lastnameController,
                          labelText: 'Last Name',
                          
                          hintText: 'Your last name',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Name field is required!';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),
                      const SizedBox(height: 16,),
                        CustomInputField(
                          controller: _instaController,
                          labelText: 'Instagram Id',
                          
                          hintText: 'Your instagram id ',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Name field is required!';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),

                      const SizedBox(height: 16,),
                        CustomInputField(
                          controller: _ProfessionController,
                          labelText: 'Profession',
                          
                          hintText: 'Your profession',
                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Name field is required!';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          controller: _emailController,
                          labelText: 'Email',
                          
                          hintText: 'Your email id',
                          isDense: true,

                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Email is required!';
                            }
                            if(!EmailValidator.validate(textValue)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                          controller: _contactController,
                          labelText: 'Contact no.',
                          hintText: 'Your contact number',

                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Contact number is required!';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),
                       CustomInputField(
                          controller: _whatsappController,
                          labelText: 'Whatsapp no.',
                          hintText: 'Your whatsapp number',

                          isDense: true,
                          validator: (textValue) {
                            if(textValue == null || textValue.isEmpty) {
                              return 'Contact number is required!';
                            }
                            return null;
                            
                          }
                      ),
                      const SizedBox(height: 16,),
                      CustomInputField(
                        controller: _passController,
                        labelText: 'Password',
                        hintText: 'Your password',
                        isDense: true,
                        obscureText: true,
                        validator: (textValue) {
                          if(textValue == null || textValue.isEmpty) {
                            return 'Password is required!';
                          }
                          return null;
                          
                        },
                        suffixIcon: true,
                      ),
                      const SizedBox(height: 22,),
                      CustomFormButton(innerText: 'Signup', onPressed:  () {
                    if (_signupFormKey.currentState!.validate() ) {
                      if (_image == null) {
        // Show an error message to the user (e.g., using a Snackbar)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select a profile image.'),
          ),
        );
                      }else{
                      // Form is valid, you can submit the event here

                        _handleSignupUser();  
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return LoginPage(onTap: () { widget.onTap; },); 
                                  },),) ;                    
                    }}
                  },),
                      const SizedBox(height: 18,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Already have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                            GestureDetector(
                              onTap: widget.onTap,
                              child: const Text('Log-in', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 
 
  void _handleSignupUser()  async { 


         String name = _nameController.text.trim();

                if(name != "") {



                }
              
        
        //create the user :  
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passController.text);

        //add user details : 
        await addUsersDetails(userCredential.user!,  _nameController.text.trim(), _lastnameController.text.trim(), _emailController.text.trim(), _contactController.text.trim(), _passController.text.trim(), _instaController.text.trim(), _whatsappController.text.trim(), _ProfessionController.text.trim(), _image!, mtoken);



      } 

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
    Future<String> addUsersDetails(User user , String name ,String lastname ,String email ,String contact ,String pass ,
     String insta ,String whatsapp ,String profession , Uint8List profilepic, String? token) async { 

        String resp = "some error occured " ; 
        try {
          String imageurl = await uploadImageToStorage(_instaController.text, profilepic);
          
          await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
         'firstName' : name, 
            'lastName' :  lastname,
            'phone' :  contact,
            'email' :  email,
            'password' :  pass,
           // 'gender' :  , 
           // 'city' :  ,
            'instagramid' :  insta,
            'whatsappnumber' :  whatsapp,
            'profession' :  profession,
            'token' : token, 
            'profilepic' :  imageurl,
            


        });
          resp = 'success' ; 
        } catch (err) {
          resp.toString();
        }
        return resp ; 
       
        
}

}
/* 

class User {
  final int id;
  final String name;
  final String  email;
  final String image ; 

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.image , 
  });

  // Convert a User into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image' :  image , 
    };
  }

  // Implement toString to make it easier to see information about
  // each user when using the print statement.
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, image: $image }';
  }
}






 */