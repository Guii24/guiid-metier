import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAuDDt06CrCrNXL71dyed91PQbEcQClGgo",
            authDomain: "guiid-metier.firebaseapp.com",
            projectId: "guiid-metier",
            storageBucket: "guiid-metier.appspot.com",
            messagingSenderId: "4600268702",
            appId: "1:4600268702:web:2058a825d5f51b8337b88f",
            measurementId: "G-6ZYEXZSWBY"));
  } else {
    await Firebase.initializeApp();
  }
}
