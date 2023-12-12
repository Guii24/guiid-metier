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

Future deleteUserData(
  List<PostRecord>? posts,
  List<CommentPostRecord>? postComments,
  List<ArticlesRecord>? articles,
  List<CommentArticleRecord>? articleComments,
  List<JobApplicantsRecord>? jobApplicants,
  List<ChatRecord>? chats,
  List<NotificationRecord>? notifications,
) async {
  for (var i in posts ?? []) {
    i.reference.delete();
  }
  for (var i in postComments ?? []) {
    i.reference.delete();
  }
  for (var i in articles ?? []) {
    i.reference.delete();
  }
  for (var i in articleComments ?? []) {
    i.reference.delete();
  }
  for (var i in jobApplicants ?? []) {
    i.reference.delete();
  }
  for (var i in chats ?? []) {
    i.reference.delete();
  }
  for (var i in notifications ?? []) {
    i.reference.delete();
  }
  // Add your function code here!
}
