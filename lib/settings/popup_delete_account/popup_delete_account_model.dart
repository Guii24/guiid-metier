import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'popup_delete_account_widget.dart' show PopupDeleteAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PopupDeleteAccountModel
    extends FlutterFlowModel<PopupDeleteAccountWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ArticlesRecord>? articles;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ChatRecord>? chats;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CommentArticleRecord>? articlesComments;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<CommentPostRecord>? commentPost;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<JobApplicantsRecord>? jobApplicants;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<NotificationRecord>? notifications;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PostRecord>? posts;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
