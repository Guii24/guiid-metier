import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDgGV2EeJENgYXc7BbK4rpkcCyfHGCIsbk",
            authDomain: "guiid-metier-9e72a.firebaseapp.com",
            projectId: "guiid-metier-9e72a",
            storageBucket: "guiid-metier-9e72a.appspot.com",
            messagingSenderId: "89777938827",
            appId: "1:89777938827:web:3dcaea8d6f6f38a7e40f8e",
            measurementId: "G-LTXN6T8FPJ"));
  } else {
    await Firebase.initializeApp();
  }
}
