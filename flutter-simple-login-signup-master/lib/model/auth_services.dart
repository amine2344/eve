

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  // firebase messagings : 
  final firebasemessaging = FirebaseMessaging.instance ;
  Future<void> initNotification () async { 
    // request permissions from user : 
    await firebasemessaging.requestPermission();
    //fetch FCM tokent from device 
    final FCMtoken = await firebasemessaging.getToken() ; 

    print ("token : $FCMtoken");
  }
  void handleMessages(RemoteMessage? message){ 
    if(message == null ){
      return ; 
    }
   /*  NavigatorKey.currentState?.pushNamed{
      'EdashedBoardScreen', 
      arguments: message , 


    } */
  }
  Future inithandleNotifications() async { 
    //handle notifications if the app terminated and  now opened
    FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
    //attach event listenears when a notification open the app 
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  }
  //google sign in :  
  signInWithGoogle() async {
    final GoogleSignInAccount? guser  = await GoogleSignIn().signIn() ; 

    final GoogleSignInAuthentication gAhuth = await guser!.authentication ; 
    
    final credential  =  GoogleAuthProvider.credential(
      accessToken: gAhuth.accessToken,
      idToken: gAhuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
      }
      
}