importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.6.10/firebase-messaging-compat.js");

// todo Copy/paste firebaseConfig from Firebase Console
const firebaseConfig = {

    apiKey: "AIzaSyBFoMW342QwmgHorttjOcKYF3fN8O2jqA4",
  
    authDomain: "auth-72203.firebaseapp.com",
  
    projectId: "auth-72203",
  
    storageBucket: "auth-72203.appspot.com",
  
    messagingSenderId: "1046501087671",
  
    appId: "1:1046501087671:web:597e98dab5e4bdf7b83032",
  
    measurementId: "G-WJTKQ4KQ1E"
  
  };
  
firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

// todo Set up background message handler