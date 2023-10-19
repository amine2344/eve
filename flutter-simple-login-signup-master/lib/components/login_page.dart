import 'package:path/path.dart'  as Path;

import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
import 'package:login_signup/components/common/page_header.dart';
import 'package:login_signup/components/forget_password_page.dart';
import 'package:login_signup/components/signup_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_signup/components/common/page_heading.dart';

import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:login_signup/screens/EADashedBoardScreen.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  //
  final _loginFormKey = GlobalKey<FormState>();

 
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xffEEF1F3),
          body: Column(
            children: [
              const PageHeader(),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          const PageHeading(title: 'Log-in',),
                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Your email id',
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
                            labelText: 'Password',
                            hintText: 'Your password',
                            obscureText: true,
                            suffixIcon: true,
                            validator: (textValue) {
                              if(textValue == null || textValue.isEmpty) {
                                return 'Password is required!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 16,),
                          Container(
                            width: size.width * 0.80,
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () => {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgetPasswordPage()))
                              },
                              child: const Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: Color(0xff939393),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          CustomFormButton(innerText: 'Login', onPressed: _handleLoginUser,),
                          const SizedBox(height: 18,),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Don\'t have an account ? ', style: TextStyle(fontSize: 13, color: Color(0xff939393), fontWeight: FontWeight.bold),),
                                GestureDetector(
                                  onTap: () => {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()))
                                  },
                                  child: const Text('Sign-up', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  

  void _handleLoginUser() async {
    // Initialize FFI
  sqfliteFfiInit();


  databaseFactory = databaseFactoryFfi;
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();


     final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    
    Path.join(await getDatabasesPath(), 'user.db'),);

  // A method that retrieves all the user from the user table.
  Future<List<User>> user() async {
   
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('user');

    // Convert the List<Map<String, dynamic> into a List<User>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        image : maps[i]['image'],
      );
    });
    
  }print(await user());
    if (_loginFormKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting data..')),
      );
     
    const EADashedBoardScreen().launch(context, isNewTask: true);



 
    }
    

  }
  
}
