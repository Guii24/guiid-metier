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

import 'package:guiid_metier/backend/firebase_storage/storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<void> deleteAllImages() async {
  final storageReference = FirebaseStorage.instance.ref();
  final ListResult listResult = await storageReference.listAll();

  for (Reference ref in listResult.items) {
    if (ref.name.endsWith('.jpg') ||
        ref.name.endsWith('.png') ||
        ref.name.endsWith('.jpeg')) {
      await ref.delete();
    }
  }

  for (Reference prefix in listResult.prefixes) {
    await deleteImagesInPrefix(prefix);
  }
}

Future<void> deleteImagesInPrefix(Reference prefix) async {
  final ListResult listResult = await prefix.listAll();

  for (Reference ref in listResult.items) {
    if (ref.name.endsWith('.jpg') ||
        ref.name.endsWith('.png') ||
        ref.name.endsWith('.jpeg')) {
      await ref.delete();
    }
  }

  for (Reference nextPrefix in listResult.prefixes) {
    await deleteImagesInPrefix(nextPrefix);
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
