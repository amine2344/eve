import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/common/custom_form_button.dart';
import 'package:login_signup/components/common/page_header.dart';
import 'package:login_signup/components/common/page_heading.dart';
import 'package:login_signup/components/common/custom_input_field.dart';
import 'package:login_signup/components/login_page.dart';

class ForgetPasswordPage extends StatefulWidget {


  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  final _forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  
  

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future password_reset()  async{ 
    try {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
           showDialog(context: context, builder: (context) {
          return     const CupertinoAlertDialog(
        title: Text('Congratulation '),
        content:  Text("Email sent, Check your email account "),
        
        
          );});
    } on FirebaseException catch (e) {
        print(e);
        // ignore: use_build_context_synchronously
        showDialog(context: context, builder: (context) {
          return     CupertinoAlertDialog(
        title: const Text('Alert '),
        content:  Text(e.message.toString()),
        
        
      );
    
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Column(
          children: [
            const PageHeader(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20),),
                ),
                child:Container(color: Colors.grey[400],child:  SingleChildScrollView(
                  
                  child: Form(
                  
                    key: _forgetPasswordFormKey,
                    child: Column(
                      children: [
                        const PageHeading(title: 'Forgot password',),
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
                        const SizedBox(height: 20,),
                        CustomFormButton(innerText: 'Submit', onPressed: password_reset),
                        const SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: (){ Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return LoginPage(onTap: () {  },); 
                                  },),) ;
                                  },
                            child: const Text(
                              'Back to login',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xff939393),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),),
          
          ],
          
        ),
      ),
    );
  }

 
 
}
