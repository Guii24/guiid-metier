import '/backend/backend.dart';
import '/components/take_photo_profile_company_widget.dart';
import '/components/take_photo_profile_user_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding_sign_in/country_code/country_code_widget.dart';
import '/onboarding_sign_in/log_in/log_in_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'sign_u_p_widget.dart' show SignUPWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SignUPModel extends FlutterFlowModel<SignUPWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Full name must be at least 2 characters long';
    }

    return null;
  }

  // State field(s) for UserPhone widget.
  FocusNode? userPhoneFocusNode;
  TextEditingController? userPhoneController;
  final userPhoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? userPhoneControllerValidator;
  // State field(s) for Checkboxuser widget.
  bool? checkboxuserValue;
  // State field(s) for companyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  String? _companyNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 2) {
      return 'Full name must be at least 2 characters long';
    }

    return null;
  }

  // State field(s) for phoneCompany widget.
  FocusNode? phoneCompanyFocusNode;
  TextEditingController? phoneCompanyController;
  final phoneCompanyMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneCompanyControllerValidator;
  // State field(s) for Checkboxcompany widget.
  bool? checkboxcompanyValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    userNameControllerValidator = _userNameControllerValidator;
    companyNameControllerValidator = _companyNameControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    userNameFocusNode?.dispose();
    userNameController?.dispose();

    userPhoneFocusNode?.dispose();
    userPhoneController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    phoneCompanyFocusNode?.dispose();
    phoneCompanyController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
