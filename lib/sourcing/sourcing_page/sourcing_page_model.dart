import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sourcing/bottom_job_details/bottom_job_details_widget.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SourcingPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ComponentSourcing component.
  late ComponentSourcingModel componentSourcingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentSourcingModel =
        createModel(context, () => ComponentSourcingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    componentSourcingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
