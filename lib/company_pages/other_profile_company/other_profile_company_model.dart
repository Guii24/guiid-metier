import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtherProfileCompanyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for ComponentSourcing component.
  late ComponentSourcingModel componentSourcingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentSourcingModel =
        createModel(context, () => ComponentSourcingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    componentSourcingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
