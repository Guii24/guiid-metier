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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'sign_u_p_model.dart';
export 'sign_u_p_model.dart';

class SignUPWidget extends StatefulWidget {
  const SignUPWidget({Key? key}) : super(key: key);

  @override
  _SignUPWidgetState createState() => _SignUPWidgetState();
}

class _SignUPWidgetState extends State<SignUPWidget>
    with TickerProviderStateMixin {
  late SignUPModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUPModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().countryInfo = jsonDecode(
            '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
        FFAppState().countryInfoCompany = jsonDecode(
            '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
        FFAppState().profilePhoto = '';
        FFAppState().profilePhotoCompany = '';
      });
      await actions.lockOrientation();
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.userNameController ??= TextEditingController();
    _model.userNameFocusNode ??= FocusNode();

    _model.userPhoneController ??= TextEditingController();
    _model.userPhoneFocusNode ??= FocusNode();

    _model.companyNameController ??= TextEditingController();
    _model.companyNameFocusNode ??= FocusNode();

    _model.phoneCompanyController ??= TextEditingController();
    _model.phoneCompanyFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              FFIcons.kbiArrowLeft,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'SIGN UP',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontSize: 16.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 16.0),
                child: Text(
                  'Choose  account type',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark68,
                        fontSize: 15.0,
                      ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).secondary,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).dark88,
                          labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondary,
                          indicatorWeight: 1.0,
                          tabs: [
                            Tab(
                              text: 'User',
                            ),
                            Tab(
                              text: 'Company',
                            ),
                          ],
                          controller: _model.tabBarController,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 36.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColorBottomSh,
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                TakePhotoProfileUserWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl: valueOrDefault<
                                                          String>(
                                                        FFAppState()
                                                            .profilePhoto,
                                                        'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                                                      ),
                                                      width: 90.0,
                                                      height: 90.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (FFAppState().profilePhoto ==
                                                      null ||
                                                  FFAppState().profilePhoto ==
                                                      '')
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColorBottomSh,
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                TakePhotoProfileUserWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Text(
                                                    'Upload profile photo *',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark88,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              if (FFAppState().profilePhoto !=
                                                      null &&
                                                  FFAppState().profilePhoto !=
                                                      '')
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColorBottomSh,
                                                      barrierColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      context: context,
                                                      builder: (context) {
                                                        return GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                TakePhotoProfileUserWidget(),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  child: Text(
                                                    'Edit profile photo',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark88,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 8.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Form(
                                              key: _model.formKey2,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.userNameController,
                                                  focusNode:
                                                      _model.userNameFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.userNameController',
                                                    Duration(milliseconds: 10),
                                                    () => setState(() {}),
                                                  ),
                                                  textCapitalization:
                                                      TextCapitalization.none,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Full name *',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark12,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark88,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  maxLines: 3,
                                                  minLines: 1,
                                                  validator: _model
                                                      .userNameControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            '^[a-zA-Z-\\\'\\.\\ \\·]{0,100}'))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 0.0),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 0.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 42.0,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark12,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Color(0x01000000),
                                                          barrierColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .dark38,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    CountryCodeWidget(
                                                                  userType:
                                                                      'User',
                                                                  signin: false,
                                                                  editprofCompany:
                                                                      false,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              '${getJsonField(
                                                                FFAppState()
                                                                    .countryInfo,
                                                                r'''$.code''',
                                                              ).toString()} ${getJsonField(
                                                                FFAppState()
                                                                    .countryInfo,
                                                                r'''$.dial_code''',
                                                              ).toString()}',
                                                              'US +1',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color:
                                                                  Colors.black,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 100.0,
                                                      child: VerticalDivider(
                                                        width: 1.0,
                                                        thickness: 1.0,
                                                        indent: 9.0,
                                                        endIndent: 9.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .userPhoneController,
                                                        focusNode: _model
                                                            .userPhoneFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.userPhoneController',
                                                          Duration(
                                                              milliseconds: 10),
                                                          () => setState(() {}),
                                                        ),
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          isDense: true,
                                                          hintText:
                                                              'Phone number *',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Libre Franklin',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .dark38,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .dark88,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                        minLines: 1,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .userPhoneControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          _model.userPhoneMask
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 24.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Theme(
                                                  data: ThemeData(
                                                    checkboxTheme:
                                                        CheckboxThemeData(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(3.0),
                                                      ),
                                                    ),
                                                    unselectedWidgetColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .dark12,
                                                  ),
                                                  child: Checkbox(
                                                    value: _model
                                                            .checkboxuserValue ??=
                                                        false,
                                                    onChanged:
                                                        (newValue) async {
                                                      setState(() => _model
                                                              .checkboxuserValue =
                                                          newValue!);
                                                    },
                                                    activeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    checkColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: RichText(
                                                  textScaleFactor:
                                                      MediaQuery.of(context)
                                                          .textScaleFactor,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            'I agree with the ',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'Privacy Policy ',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark88,
                                                          fontSize: 13.0,
                                                        ),
                                                        mouseCursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap =
                                                                  () async {
                                                                context.pushNamed(
                                                                    'PrivacyPolicy');
                                                              },
                                                      ),
                                                      TextSpan(
                                                        text: 'and ',
                                                        style: TextStyle(
                                                          fontSize: 13.0,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: 'Terms of Use',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark88,
                                                          fontSize: 13.0,
                                                        ),
                                                        mouseCursor:
                                                            SystemMouseCursors
                                                                .click,
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap =
                                                                  () async {
                                                                context.pushNamed(
                                                                    'TermsofUse');
                                                              },
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.21,
                                    decoration: BoxDecoration(),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'email',
                                            isEqualTo:
                                                '${functions.deleteSpaceAndDivider('${getJsonField(
                                              FFAppState().countryInfo,
                                              r'''$.dial_code''',
                                            ).toString()}${_model.userPhoneController.text}')}@gmail.com',
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              buttonUsersRecordList =
                                              snapshot.data!;
                                          final buttonUsersRecord =
                                              buttonUsersRecordList.isNotEmpty
                                                  ? buttonUsersRecordList.first
                                                  : null;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              if (_model.formKey2
                                                          .currentState ==
                                                      null ||
                                                  !_model.formKey2.currentState!
                                                      .validate()) {
                                                return;
                                              }
                                              if (FFAppState().profilePhoto ==
                                                      null ||
                                                  FFAppState().profilePhoto ==
                                                      '') {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please upload a profile photo.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        Color(0xCD000000),
                                                  ),
                                                );
                                              } else if (!functions.counter(
                                                  _model
                                                      .userPhoneController.text,
                                                  14)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please enter a valid phone number.',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        Color(0xCD000000),
                                                  ),
                                                );
                                              } else if (!_model
                                                  .checkboxuserValue!) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Please mark checkbox',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        Color(0xCD000000),
                                                  ),
                                                );
                                              } else if (functions
                                                  .containsProfanity(_model
                                                      .userNameController
                                                      .text)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'No profanity words allowed',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 3000),
                                                    backgroundColor:
                                                        Color(0xCD000000),
                                                  ),
                                                );
                                              } else {
                                                context.pushNamed(
                                                  'VerificationSignUp',
                                                  queryParameters: {
                                                    'userName': serializeParam(
                                                      _model.userNameController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'userPhone': serializeParam(
                                                      functions
                                                          .deleteSpaceAndDivider(
                                                              '${getJsonField(
                                                        FFAppState()
                                                            .countryInfo,
                                                        r'''$.dial_code''',
                                                      ).toString()}${_model.userPhoneController.text}'),
                                                      ParamType.String,
                                                    ),
                                                    'profilePhoto':
                                                        serializeParam(
                                                      FFAppState().profilePhoto,
                                                      ParamType.String,
                                                    ),
                                                    'userType': serializeParam(
                                                      'User',
                                                      ParamType.String,
                                                    ),
                                                    'phoneoriginal':
                                                        serializeParam(
                                                      _model.userPhoneController
                                                          .text,
                                                      ParamType.String,
                                                    ),
                                                    'phoneName': serializeParam(
                                                      getJsonField(
                                                        FFAppState()
                                                            .countryInfo,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'phoneCode': serializeParam(
                                                      getJsonField(
                                                        FFAppState()
                                                            .countryInfo,
                                                        r'''$.code''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'phoneFlag': serializeParam(
                                                      getJsonField(
                                                        FFAppState()
                                                            .countryInfo,
                                                        r'''$.flag''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'phoneDialCode':
                                                        serializeParam(
                                                      getJsonField(
                                                        FFAppState()
                                                            .countryInfo,
                                                        r'''$.dial_code''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              }
                                            },
                                            text: 'CONTINUE',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.5,
                                                      ),
                                              elevation: 0.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 1.00),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 26.0, 0.0, 16.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: LogInWidget(
                                                      back: false,
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Have an account? ',
                                                  style: TextStyle(),
                                                ),
                                                TextSpan(
                                                  text: 'Sign in',
                                                  style: GoogleFonts.getFont(
                                                    'Libre Franklin',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dark88,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15.0,
                                                  ),
                                                )
                                              ],
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .dark38,
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 36.0, 0.0, 15.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        TakePhotoProfileCompanyWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: valueOrDefault<String>(
                                                FFAppState()
                                                    .profilePhotoCompany,
                                                'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                                              ),
                                              width: 90.0,
                                              height: 90.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (FFAppState().profilePhotoCompany ==
                                              null ||
                                          FFAppState().profilePhotoCompany ==
                                              '')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        TakePhotoProfileCompanyWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Text(
                                            'Upload profile photo *',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      if (FFAppState().profilePhotoCompany !=
                                              null &&
                                          FFAppState().profilePhotoCompany !=
                                              '')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              context: context,
                                              builder: (context) {
                                                return GestureDetector(
                                                  onTap: () => _model
                                                          .unfocusNode
                                                          .canRequestFocus
                                                      ? FocusScope.of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode)
                                                      : FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        TakePhotoProfileCompanyWidget(),
                                                  ),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          child: Text(
                                            'Edit profile photo',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 30.0, 0.0, 8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            child: Form(
                                              key: _model.formKey1,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller: _model
                                                      .companyNameController,
                                                  focusNode: _model
                                                      .companyNameFocusNode,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.companyNameController',
                                                    Duration(milliseconds: 10),
                                                    () => setState(() {}),
                                                  ),
                                                  textCapitalization:
                                                      TextCapitalization.none,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    labelText: 'Company name *',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark12,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark88,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  maxLines: 3,
                                                  minLines: 1,
                                                  validator: _model
                                                      .companyNameControllerValidator
                                                      .asValidator(context),
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .allow(RegExp(
                                                            '^[a-zA-Z-\\\'\\.\\ \\·]{0,100}'))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 25.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 42.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark12,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Color(0x01000000),
                                                        barrierColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark38,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  CountryCodeWidget(
                                                                userType:
                                                                    'Company',
                                                                signin: false,
                                                                editprofCompany:
                                                                    false,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            '${getJsonField(
                                                              FFAppState()
                                                                  .countryInfoCompany,
                                                              r'''$.code''',
                                                            ).toString()} ${getJsonField(
                                                              FFAppState()
                                                                  .countryInfoCompany,
                                                              r'''$.dial_code''',
                                                            ).toString()}',
                                                            'US +1',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: Colors.black,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 100.0,
                                                    child: VerticalDivider(
                                                      width: 1.0,
                                                      thickness: 1.0,
                                                      indent: 9.0,
                                                      endIndent: 9.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: TextFormField(
                                                      controller: _model
                                                          .phoneCompanyController,
                                                      focusNode: _model
                                                          .phoneCompanyFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.phoneCompanyController',
                                                        Duration(
                                                            milliseconds: 10),
                                                        () => setState(() {}),
                                                      ),
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: true,
                                                        hintText:
                                                            'Phone number *',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .dark38,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dark88,
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                      minLines: 1,
                                                      keyboardType:
                                                          TextInputType.number,
                                                      validator: _model
                                                          .phoneCompanyControllerValidator
                                                          .asValidator(context),
                                                      inputFormatters: [
                                                        _model.phoneCompanyMask
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Theme(
                                              data: ThemeData(
                                                checkboxTheme:
                                                    CheckboxThemeData(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3.0),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                    FlutterFlowTheme.of(context)
                                                        .dark12,
                                              ),
                                              child: Checkbox(
                                                value: _model
                                                        .checkboxcompanyValue ??=
                                                    false,
                                                onChanged: (newValue) async {
                                                  setState(() => _model
                                                          .checkboxcompanyValue =
                                                      newValue!);
                                                },
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                checkColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: RichText(
                                              textScaleFactor:
                                                  MediaQuery.of(context)
                                                      .textScaleFactor,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'I agree with the ',
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Privacy Policy ',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark88,
                                                      fontSize: 13.0,
                                                    ),
                                                    mouseCursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () async {
                                                            context.pushNamed(
                                                                'PrivacyPolicy');
                                                          },
                                                  ),
                                                  TextSpan(
                                                    text: 'and ',
                                                    style: TextStyle(
                                                      fontSize: 13.0,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: 'Terms of Use',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .dark88,
                                                      fontSize: 13.0,
                                                    ),
                                                    mouseCursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () async {
                                                            context.pushNamed(
                                                                'TermsofUse');
                                                          },
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Flexible(
                                    child: Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.21,
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey1.currentState ==
                                              null ||
                                          !_model.formKey1.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (FFAppState().profilePhotoCompany ==
                                              null ||
                                          FFAppState().profilePhotoCompany ==
                                              '') {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please upload a profile photo.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xCD000000),
                                          ),
                                        );
                                      } else if (!functions.counter(
                                          _model.phoneCompanyController.text,
                                          14)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please enter a valid phone number.',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xCD000000),
                                          ),
                                        );
                                      } else if (!_model
                                          .checkboxcompanyValue!) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please mark checkbox',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xCD000000),
                                          ),
                                        );
                                      } else if (functions.containsProfanity(
                                          _model.companyNameController.text)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'No profanity words allowed',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 3000),
                                            backgroundColor: Color(0xCD000000),
                                          ),
                                        );
                                      } else {
                                        context.pushNamed(
                                          'VerificationSignUp',
                                          queryParameters: {
                                            'userPhone': serializeParam(
                                              functions.deleteSpaceAndDivider(
                                                  '${getJsonField(
                                                FFAppState().countryInfoCompany,
                                                r'''$.dial_code''',
                                              ).toString()}${_model.phoneCompanyController.text}'),
                                              ParamType.String,
                                            ),
                                            'profilePhoto': serializeParam(
                                              FFAppState().profilePhotoCompany,
                                              ParamType.String,
                                            ),
                                            'userType': serializeParam(
                                              'Company',
                                              ParamType.String,
                                            ),
                                            'userName': serializeParam(
                                              _model.companyNameController.text,
                                              ParamType.String,
                                            ),
                                            'phoneoriginal': serializeParam(
                                              _model
                                                  .phoneCompanyController.text,
                                              ParamType.String,
                                            ),
                                            'phoneName': serializeParam(
                                              getJsonField(
                                                FFAppState().countryInfoCompany,
                                                r'''$.name''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'phoneCode': serializeParam(
                                              getJsonField(
                                                FFAppState().countryInfoCompany,
                                                r'''$.code''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'phoneFlag': serializeParam(
                                              getJsonField(
                                                FFAppState().countryInfoCompany,
                                                r'''$.flag''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                            'phoneDialCode': serializeParam(
                                              getJsonField(
                                                FFAppState().countryInfoCompany,
                                                r'''$.dial_code''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      }
                                    },
                                    text: 'CONTINUE',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            letterSpacing: 0.5,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 26.0, 0.0, 16.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          barrierColor:
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: LogInWidget(
                                                  back: false,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: RichText(
                                        textScaleFactor: MediaQuery.of(context)
                                            .textScaleFactor,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Have an account? ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: 'Sign in',
                                              style: GoogleFonts.getFont(
                                                'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark88,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15.0,
                                              ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark38,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
