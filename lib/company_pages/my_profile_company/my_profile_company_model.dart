import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/company_pages/component_post_company/component_post_company_widget.dart';
import '/company_pages/empty_jobs/empty_jobs_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_profile/empty_post_my_prof/empty_post_my_prof_widget.dart';
import '/post/component_post_reposted/component_post_reposted_widget.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import '/flutter_flow/request_manager.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyProfileCompanyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Query cache managers for this widget.

  final _jobsManager = StreamRequestManager<List<JobRecord>>();
  Stream<List<JobRecord>> jobs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<JobRecord>> Function() requestFn,
  }) =>
      _jobsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearJobsCache() => _jobsManager.clear();
  void clearJobsCacheKey(String? uniqueKey) =>
      _jobsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();

    /// Dispose query cache managers for this widget.

    clearJobsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
