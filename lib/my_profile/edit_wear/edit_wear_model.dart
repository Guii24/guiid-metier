import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/post/create_post/component_wear/component_wear_widget.dart';
import '/post/create_post/custom_dialog_edit_wear/custom_dialog_edit_wear_widget.dart';
import '/post/create_post/empty_create_wear/empty_create_wear_widget.dart';
import '/post/create_post/popup_cancel/popup_cancel_widget.dart';
import '/post/take_photo_wear/take_photo_wear_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'edit_wear_widget.dart' show EditWearWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditWearModel extends FlutterFlowModel<EditWearWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
