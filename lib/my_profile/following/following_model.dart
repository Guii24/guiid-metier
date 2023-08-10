import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/my_profile/component_following/component_following_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FollowingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ComponentFollowing component.
  late ComponentFollowingModel componentFollowingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentFollowingModel =
        createModel(context, () => ComponentFollowingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    componentFollowingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
