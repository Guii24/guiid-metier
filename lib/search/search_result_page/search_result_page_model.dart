import '/company_pages/component_companies/component_companies_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/search/component_people/component_people_widget.dart';
import '/sourcing/bottom_job_details/bottom_job_details_widget.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchResultPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ComponentPeople component.
  late ComponentPeopleModel componentPeopleModel;
  // Model for ComponentCompanies component.
  late ComponentCompaniesModel componentCompaniesModel;
  // Model for ComponentSourcing component.
  late ComponentSourcingModel componentSourcingModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    componentPeopleModel = createModel(context, () => ComponentPeopleModel());
    componentCompaniesModel =
        createModel(context, () => ComponentCompaniesModel());
    componentSourcingModel =
        createModel(context, () => ComponentSourcingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    componentPeopleModel.dispose();
    componentCompaniesModel.dispose();
    componentSourcingModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
