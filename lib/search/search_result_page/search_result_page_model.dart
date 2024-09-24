import '/articles/articles_component/articles_component_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/company_pages/component_companies/component_companies_widget.dart';
import '/components/empty_search_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/jobs/bottom_job_details/bottom_job_details_widget.dart';
import '/post/post_types_for_search/post_types_for_search_widget.dart';
import '/search/component_people/component_people_widget.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_result_page_widget.dart' show SearchResultPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchResultPageModel extends FlutterFlowModel<SearchResultPageWidget> {
  ///  Local state fields for this page.

  String choosenTab = 'People';

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
