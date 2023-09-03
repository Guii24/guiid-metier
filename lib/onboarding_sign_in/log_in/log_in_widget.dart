import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding_sign_in/country_code/country_code_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'log_in_model.dart';
export 'log_in_model.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({
    Key? key,
    required this.back,
  }) : super(key: key);

  final bool? back;

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  late LogInModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogInModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'WELCOME BACK!1',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).dark6,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 32.0, 0.0),
                  child: Text(
                    'To sign in to your account, choose country code and enter the phone number',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          color: FlutterFlowTheme.of(context).dark68,
                          fontSize: 15.0,
                          letterSpacing: 0.05,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 22.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 42.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Color(0x01000000),
                                  barrierColor:
                                      FlutterFlowTheme.of(context).dark38,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CountryCodeWidget(
                                        signin: true,
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().countryInfo == null)
                                    Text(
                                      'US +1',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  if (FFAppState().countryInfo != null)
                                    Text(
                                      '${getJsonField(
                                        FFAppState().countryInfo,
                                        r'''$.code''',
                                      ).toString()} ${getJsonField(
                                        FFAppState().countryInfo,
                                        r'''$.dial_code''',
                                      ).toString()}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
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
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 10),
                                  () => setState(() {}),
                                ),
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Phone number *',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark38,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 12.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark88,
                                      fontWeight: FontWeight.w500,
                                    ),
                                maxLines: null,
                                keyboardType: TextInputType.number,
                                cursorColor:
                                    FlutterFlowTheme.of(context).secondary,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.textFieldMask],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where('email',
                        isEqualTo:
                            '${functions.deleteSpaceAndDivider('${getJsonField(
                          FFAppState().countryInfo,
                          r'''$.dial_code''',
                        ).toString()}${_model.textController.text}')}@gmail.com'),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 30.0,
                          height: 30.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> buttonUsersRecordList = snapshot.data!;
                    final buttonUsersRecord = buttonUsersRecordList.isNotEmpty
                        ? buttonUsersRecordList.first
                        : null;
                    return FFButtonWidget(
                      onPressed: !(buttonUsersRecord != null)
                          ? null
                          : () async {
                              context.pushNamed(
                                'VerificationLogin',
                                queryParameters: {
                                  'userPhone': serializeParam(
                                    functions
                                        .deleteSpaceAndDivider('${getJsonField(
                                      FFAppState().countryInfo,
                                      r'''$.dial_code''',
                                    ).toString()}${_model.textController.text}'),
                                    ParamType.String,
                                  ),
                                  'countrycode': serializeParam(
                                    FFAppState().countryInfo,
                                    ParamType.JSON,
                                  ),
                                }.withoutNulls,
                              );
                            },
                      text: 'SIGN IN',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                        disabledTextColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                      if (widget.back!) {
                        context.pushNamed('SignUP');
                      } else {
                        context.goNamed(
                          'SignUP',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }
                    },
                    child: Text(
                      'Not yet a member? Sign up',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
