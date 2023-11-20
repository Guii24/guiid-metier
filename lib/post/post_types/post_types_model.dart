import '/backend/backend.dart';
import '/company_pages/component_post_company/component_post_company_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/component_post_reposted/component_post_reposted_widget.dart';
import '/post/component_post_user/component_post_user_widget.dart';
import 'post_types_widget.dart' show PostTypesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostTypesModel extends FlutterFlowModel<PostTypesWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ComponentPostUser component.
  late ComponentPostUserModel componentPostUserModel;
  // Model for ComponentPostCompany component.
  late ComponentPostCompanyModel componentPostCompanyModel;
  // Model for ComponentPostReposted component.
  late ComponentPostRepostedModel componentPostRepostedModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentPostUserModel =
        createModel(context, () => ComponentPostUserModel());
    componentPostCompanyModel =
        createModel(context, () => ComponentPostCompanyModel());
    componentPostRepostedModel =
        createModel(context, () => ComponentPostRepostedModel());
  }

  void dispose() {
    componentPostUserModel.dispose();
    componentPostCompanyModel.dispose();
    componentPostRepostedModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
