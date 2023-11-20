import '/articles/articles_component/articles_component_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'articles_user_copy_widget.dart' show ArticlesUserCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ArticlesUserCopyModel extends FlutterFlowModel<ArticlesUserCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for ArticlesComponent dynamic component.
  late FlutterFlowDynamicModels<ArticlesComponentModel> articlesComponentModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    articlesComponentModels =
        FlutterFlowDynamicModels(() => ArticlesComponentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    articlesComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
