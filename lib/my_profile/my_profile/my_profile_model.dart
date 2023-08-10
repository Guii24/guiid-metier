import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/my_profile/empty_post_my_prof/empty_post_my_prof_widget.dart';
import '/post/component_post_user/component_post_user_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for ComponentPostUser dynamic component.
  late FlutterFlowDynamicModels<ComponentPostUserModel> componentPostUserModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentPostUserModels =
        FlutterFlowDynamicModels(() => ComponentPostUserModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    componentPostUserModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
