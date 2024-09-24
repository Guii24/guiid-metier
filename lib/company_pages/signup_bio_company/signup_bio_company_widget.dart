import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/sign_u_p/bottom_preference/bottom_preference_widget.dart';
import '/sign_u_p/sign_up_location/sign_up_location_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'signup_bio_company_model.dart';
export 'signup_bio_company_model.dart';

class SignupBioCompanyWidget extends StatefulWidget {
  const SignupBioCompanyWidget({super.key});

  @override
  State<SignupBioCompanyWidget> createState() => _SignupBioCompanyWidgetState();
}

class _SignupBioCompanyWidgetState extends State<SignupBioCompanyWidget> {
  late SignupBioCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupBioCompanyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedlocation = '';
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'SIGN UP',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'MainPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Text(
                    'SKIP',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          fontSize: 15.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => ClipRRect(
                              borderRadius: BorderRadius.circular(100.0),
                              child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 500),
                                fadeOutDuration: Duration(milliseconds: 500),
                                imageUrl: valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                                ),
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 30.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => Text(
                                currentUserDisplayName,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark88,
                                      fontSize: 19.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            height: 56.0,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 1.0),
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
                                            FlutterFlowTheme.of(context).dark38,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.85,
                                                child: SignUpLocationWidget(
                                                  type: 'Location',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
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
                                            color: FlutterFlowTheme.of(context)
                                                .dark12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (FFAppState()
                                                          .selectedlocation ==
                                                      null ||
                                                  FFAppState()
                                                          .selectedlocation ==
                                                      '')
                                                Text(
                                                  'Located in ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .dark38,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              if (FFAppState()
                                                          .selectedlocation !=
                                                      null &&
                                                  FFAppState()
                                                          .selectedlocation !=
                                                      '')
                                                Text(
                                                  FFAppState()
                                                      .selectedlocation
                                                      .maybeHandleOverflow(
                                                        maxChars: 38,
                                                        replacement: '…',
                                                      ),
                                                  maxLines: 1,
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
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (FFAppState().selectedlocation != null &&
                                    FFAppState().selectedlocation != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 90.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  3.0, 0.0, 3.0, 0.0),
                                          child: Text(
                                            'Located in',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: Text(
                            'About (bio)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Container(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.textController',
                                Duration(milliseconds: 10),
                                () => safeSetState(() {}),
                              ),
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: true,
                                hintText: 'Write about your company',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark38,
                                      fontSize: 15.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).dark12,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).dark12,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(3.0),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              maxLines: 6,
                              validator: _model.textControllerValidator
                                  .asValidator(context),
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('^.{1,250}'))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Text(
                            'Type only 250 characters',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark68,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 15.0),
                          child: Text(
                            'Preferences',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: Container(
                            width: double.infinity,
                            height: 42.0,
                            child: Stack(
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).dark38,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: BottomPreferenceWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .dark12,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (FFAppState()
                                                    .choosenPreference
                                                    .length ==
                                                0)
                                              Text(
                                                'Choose your preferences',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .dark38,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            if (FFAppState()
                                                    .choosenPreference
                                                    .length !=
                                                0)
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final item = FFAppState()
                                                        .choosenPreference
                                                        .toList();

                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: List.generate(
                                                            item.length,
                                                            (itemIndex) {
                                                          final itemItem =
                                                              item[itemIndex];
                                                          return Text(
                                                            itemIndex ==
                                                                    (FFAppState()
                                                                            .choosenPreference
                                                                            .length -
                                                                        1)
                                                                ? itemItem
                                                                : '${itemItem}, ',
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Libre Franklin',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .dark88,
                                                                  fontSize:
                                                                      15.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          );
                                                        }).addToEnd(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            if (FFAppState()
                                                    .choosenPreference
                                                    .length ==
                                                0)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: Icon(
                                                  FFIcons.kchevronBottomSm,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark88,
                                                  size: 24.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
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
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0.0,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15.0,
                          color: Color(0x12000000),
                          offset: Offset(
                            0.0,
                            -6.0,
                          ),
                        )
                      ],
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 16.0, 10.0),
                        child: FFButtonWidget(
                          onPressed: () {
                            if (FFAppState().selectedlocation != null &&
                                FFAppState().selectedlocation != '') {
                              return false;
                            } else if (_model.textController.text != null &&
                                _model.textController.text != '') {
                              return false;
                            } else if (FFAppState().preference.length >= 1) {
                              return false;
                            } else {
                              return true;
                            }
                          }()
                              ? null
                              : () async {
                                  await currentUserReference!.update({
                                    ...createUsersRecordData(
                                      userBio: _model.textController.text,
                                      userLocation:
                                          FFAppState().selectedlocation,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'user_preferences':
                                            FFAppState().choosenPreference,
                                      },
                                    ),
                                  });
                                  FFAppState().selectedlocation = '';
                                  FFAppState().choosenPreference = [];
                                  safeSetState(() {});

                                  context.goNamed(
                                    'MainPage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                          text: 'SAVE',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primaryText,
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
                            disabledColor: Color(0xFFC9C9C9),
                            disabledTextColor:
                                FlutterFlowTheme.of(context).primary,
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
      ),
    );
  }
}
