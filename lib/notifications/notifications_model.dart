import '/components/component_notification_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ComponentNotification component.
  late ComponentNotificationModel componentNotificationModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentNotificationModel =
        createModel(context, () => ComponentNotificationModel());
  }

  void dispose() {
    unfocusNode.dispose();
    componentNotificationModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
