import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/settings/custom_dialog_phone_change/custom_dialog_phone_change_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_edit_phone_model.dart';
export 'verification_edit_phone_model.dart';

class VerificationEditPhoneWidget extends StatefulWidget {
  const VerificationEditPhoneWidget({
    Key? key,
    required this.phoneOrifinal,
    required this.phoneNumberEdited,
    required this.phoneName,
    required this.phoneCode,
    required this.phoneFlag,
    required this.phoneDialCode,
  }) : super(key: key);

  final String? phoneOrifinal;
  final String? phoneNumberEdited;
  final String? phoneName;
  final String? phoneCode;
  final String? phoneFlag;
  final String? phoneDialCode;

  @override
  _VerificationEditPhoneWidgetState createState() =>
      _VerificationEditPhoneWidgetState();
}

class _VerificationEditPhoneWidgetState
    extends State<VerificationEditPhoneWidget> {
  late VerificationEditPhoneModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationEditPhoneModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onExecute.add(StopWatchExecute.start);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
              context.safePop();
            },
          ),
          title: Text(
            'VERIFICATION',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontSize: 16.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Builder(
                  builder: (context) => Container(
                    width: double.infinity,
                    height: 120.0,
                    child: custom_widgets.PinCode(
                      width: double.infinity,
                      height: 120.0,
                      code: '1111',
                      onCompleted: () async {
                        await actions.reAuthUser(
                          currentUserEmail,
                          '123456',
                        );

                        await currentUserReference!
                            .update(createUsersRecordData(
                          phoneNumber: widget.phoneOrifinal,
                          userPhoneName: widget.phoneName,
                          userPhoneCode: widget.phoneCode,
                          userPhoneFlag: widget.phoneFlag,
                          userPhoneDialCode: widget.phoneDialCode,
                        ));
                        if ('${widget.phoneNumberEdited}@gmail.com'.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Email required!',
                              ),
                            ),
                          );
                          return;
                        }

                        await authManager.updateEmail(
                          email: '${widget.phoneNumberEdited}@gmail.com',
                          context: context,
                        );
                        setState(() {});

                        showAlignedDialog(
                          barrierColor: Color(0x02000000),
                          barrierDismissible: false,
                          context: context,
                          isGlobal: true,
                          avoidOverflow: false,
                          targetAnchor: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          followerAnchor: AlignmentDirectional(0.0, -1.0)
                              .resolve(Directionality.of(context)),
                          builder: (dialogContext) {
                            return Material(
                              color: Colors.transparent,
                              child: GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode),
                                child: CustomDialogPhoneChangeWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));

                        await Future.delayed(
                            const Duration(milliseconds: 1200));
                        setState(() {
                          FFAppState().countryInfo = jsonDecode(
                              '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
                          FFAppState().countryInfoCompany = jsonDecode(
                              '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
                          FFAppState().page = 'Articles';
                          FFAppState().pageIndex = 0;
                        });

                        context.goNamed('MainPage');
                      },
                      onChange: () async {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 15.0),
                  child: Text(
                    'Didn\'t receive a code?',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          color: FlutterFlowTheme.of(context).dark68,
                          fontSize: 15.0,
                        ),
                  ),
                ),
                if (_model.timerMilliseconds != 00)
                  Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Container(
                      width: 212.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(
                          color: Color(0xFFE6E6E6),
                          width: 1.0,
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: FlutterFlowTimer(
                          initialTime: _model.timerMilliseconds,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            minute: false,
                            milliSecond: false,
                          ),
                          timer: _model.timerController,
                          updateStateInterval: Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) setState(() {});
                          },
                          onEnded: () async {
                            await actions.updatePage(
                              context,
                            );
                          },
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                if (_model.timerMilliseconds == 0)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.timerMilliseconds == 0) {
                        _model.timerController.onExecute
                            .add(StopWatchExecute.reset);

                        _model.timerController.onExecute
                            .add(StopWatchExecute.start);
                      }
                    },
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Container(
                        width: 212.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6E6E6),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'Send again',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
