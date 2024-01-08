import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/jobs/custom_dialog_posting_job/custom_dialog_posting_job_widget.dart';
import '/jobs/job_type/job_type_widget.dart';
import '/onboarding_sign_in/country_code/country_code_widget.dart';
import '/sign_u_p/sign_up_location/sign_up_location_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'post_job_page_widget.dart' show PostJobPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PostJobPageModel extends FlutterFlowModel<PostJobPageWidget> {
  ///  Local state fields for this page.

  bool validTitle = false;

  bool validLocation = false;

  bool validJobType = false;

  bool validRate = false;

  bool valisEmail = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for UserPhone widget.
  FocusNode? userPhoneFocusNode;
  TextEditingController? userPhoneController;
  final userPhoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? userPhoneControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    userPhoneFocusNode?.dispose();
    userPhoneController?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
