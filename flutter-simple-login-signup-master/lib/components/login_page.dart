import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:login_signup/components/forget_password_page.dart';
import 'package:login_signup/model/auth_services.dart';

import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
import 'package:login_signup/components/common/page_header.dart';
import 'package:email_validator/email_validator.dart';
import 'package:login_signup/components/common/page_heading.dart';

import 'package:login_signup/components/common/custom_form_button.dart';



class LoginPage extends StatefulWidget {
  final  Function()? onTap;
  const LoginPage({super.key, required  this.onTap});

  static const routeName = './login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  //
  final _loginFormKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          
           body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
         child: Column(
            children: [
              
              const PageHeader(),
              Expanded(
               
               

                  child: SingleChildScrollView(
                    child: Form(
                      key: _loginFormKey,
                      child: Column(
                        children: [
                          const PageHeading(title: 'Log-in',),

                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Your email id',
                            controller: _emailController,
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
                            controller: _passwordController,
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
                              onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return ForgetPasswordPage(); 
                                  },),) ;
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
                                  onTap: widget.onTap ,
                                  child: const Text('Sign-up', style: TextStyle(fontSize: 15, color: Color(0xff748288), fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                            
                          ), 
                                                    const SizedBox(height: 20,),

                           Padding(
                padding: const EdgeInsets.symmetric(horizontal: 55.0),
                
                child: Row(
                  children: [

                     const Divider( // Creates a horizontal divider
                thickness: 15, height: 12, indent: 1, // Set the thickness of the divider
                color: Colors.white, // Set the color of the divider
              ),
                    Expanded(child: Divider(thickness: 1,color: Colors.grey[700]),),
                    
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                     child: Text("Or continue with ", style: TextStyle(color: Colors.grey[700],),),
                   ),
                   Expanded(child: Divider(thickness: 1, color: Colors.grey[700]),), 
                  ],
                ),
              ),
                                        const SizedBox(height: 20,),

             Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SignInButton(
              Buttons.Google,
              onPressed: () {
                // Handle Google sign-in here.
                AuthService().signInWithGoogle(); 
              },
            ),
            const SizedBox(height: 20),
            SignInButton(
              Buttons.Apple,
              onPressed: () {
                // Handle Apple sign-in here.
              },
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
                
              
            
            ],
          ),
        ),
    ),
    );
  }
  

  void _handleLoginUser() async {
    // Initialize FFI
 // sqfliteFfiInit();


 // databaseFactory = databaseFactoryFfi;
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
 // WidgetsFlutterBinding.ensureInitialized();


  //   final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    
  ///  Path.join(await getDatabasesPath(), 'user.db'),);

  // A method that retrieves all the user from the user table.
  //Future<List<User>> user() async {
   
    // Get a reference to the database.
    //final db = await database;

    // Query the table for all The Dogs.
    //final List<Map<String, dynamic>> maps = await db.query('user');

    // Convert the List<Map<String, dynamic> into a List<User>.
    /* return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        email: maps[i]['email'],
        image : maps[i]['image'],
      );
    });
    
  }print(await user()); */
  CupertinoActivityIndicator();
  
  print("text : ${_emailController.text}");
  try {
    
    (BuildContext context) {
      loading(context);
      CupertinoActivityIndicator();
      Navigator.pop(context);
    };
        CupertinoActivityIndicator(); // Show a loading indicator while fetching data.
      
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
      
  } on FirebaseAuthException catch (e) {
    
    wrongEmail(e.code);
  }
   
   
     



 
  }

  void wrongEmail(String message ) {
    showDialog(context: context, builder: (context) {
       return CupertinoAlertDialog(
        title: const Text('Alert '),
        content: const Text('User not found forgot your password ? '),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {


              Navigator.pop(context);
              
            },
            child: const Text('Yes'),
          ),
        ],
      );
    
    },);
  }void loading(BuildContext context ) {
    showDialog(context: context, builder: (context) {
    
       return    const Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Cupertino activity indicator with default properties.
                CupertinoActivityIndicator(),
                SizedBox(height: 10),
                Text('log in ...'), 
              ],
            ),
          ],
        ),
        );
            
    },);
    
  }


    

}
  

