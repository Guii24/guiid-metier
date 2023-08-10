import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/my_profile/component_follow/component_follow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FollowersModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ComponentFollow component.
  late ComponentFollowModel componentFollowModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentFollowModel = createModel(context, () => ComponentFollowModel());
  }

  void dispose() {
    unfocusNode.dispose();
    componentFollowModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
