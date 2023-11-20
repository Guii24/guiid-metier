import '/backend/backend.dart';
import '/company_pages/component_post_company/component_post_company_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/component_post_user/component_post_user_widget.dart';
import 'post_types_for_search_widget.dart' show PostTypesForSearchWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PostTypesForSearchModel
    extends FlutterFlowModel<PostTypesForSearchWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ComponentPostUser component.
  late ComponentPostUserModel componentPostUserModel;
  // Model for ComponentPostCompany component.
  late ComponentPostCompanyModel componentPostCompanyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentPostUserModel =
        createModel(context, () => ComponentPostUserModel());
    componentPostCompanyModel =
        createModel(context, () => ComponentPostCompanyModel());
  }

  void dispose() {
    componentPostUserModel.dispose();
    componentPostCompanyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
