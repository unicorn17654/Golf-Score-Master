import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBLdM3Nmf_mVFNGG8Co7bGSQqT3coIU_6s",
            authDomain: "winstone-golf-tracker.firebaseapp.com",
            projectId: "winstone-golf-tracker",
            storageBucket: "winstone-golf-tracker.appspot.com",
            messagingSenderId: "154985667355",
            appId: "1:154985667355:web:e4af2a41a7be27eb6551be"));
  } else {
    await Firebase.initializeApp();
  }
}
