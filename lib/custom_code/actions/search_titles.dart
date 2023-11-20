// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> searchTitles(String query) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = firestore.collection('users');

  QuerySnapshot userSnapshot = await users.get();

  if (userSnapshot.docs.isEmpty) {
    return [];
  }

  List<String> displayNames = [];
  for (var doc in userSnapshot.docs) {
    if (doc['display_name'].contains(query)) {
      displayNames.add(doc['display_name']);
    }
  }

  return displayNames;
}
// for (UsersRecord item in users) {
//     String name = '${item.displayName}'.toLowerCase();
//     if (name.contains(searchingText.toLowerCase())) {
//       filteredUsers.add(item);
//     }
//   }
