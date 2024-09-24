import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'verification_login_model.dart';
export 'verification_login_model.dart';

class VerificationLoginWidget extends StatefulWidget {
  const VerificationLoginWidget({
    super.key,
    this.userPhone,
    this.countrycode,
  });

  final String? userPhone;
  final dynamic countrycode;

  @override
  State<VerificationLoginWidget> createState() =>
      _VerificationLoginWidgetState();
}

class _VerificationLoginWidgetState extends State<VerificationLoginWidget> {
  late VerificationLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificationLoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      _model.code = random_data.randomInteger(1000, 9999).toString();
      safeSetState(() {});
      await TwilioCall.call(
        to: widget!.userPhone,
        body: 'Your GMSM verification code is: ${_model.code}',
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
              GoRouter.of(context).prepareAuthEvent();
              await authManager.signOut();
              GoRouter.of(context).clearRedirectLocation();

              context.goNamedAuth('Onboarding', context.mounted);
            },
          ),
          title: Text(
            'VERIFICATION',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
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
                Text(
                  'We have sent a code to your number',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark68,
                        fontSize: 15.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Container(
                  width: double.infinity,
                  height: 120.0,
                  child: custom_widgets.PinCode(
                    width: double.infinity,
                    height: 120.0,
                    code: _model.code!,
                    onCompleted: () async {
                      GoRouter.of(context).prepareAuthEvent();

                      final user = await authManager.signInWithEmail(
                        context,
                        '${widget!.userPhone}@gmail.com',
                        '123456',
                      );
                      if (user == null) {
                        return;
                      }

                      context.goNamedAuth('SpashScreen', context.mounted);
                    },
                    onChange: () async {},
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
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                if (_model.timerMilliseconds != 0)
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
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowTimer(
                          initialTime: _model.timerInitialTimeMs,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            minute: false,
                            milliSecond: false,
                          ),
                          controller: _model.timerController,
                          updateStateInterval: Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            _model.timerMilliseconds = value;
                            _model.timerValue = displayTime;
                            if (shouldUpdate) safeSetState(() {});
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
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                    ),
                  ),
                if (_model.timerMilliseconds == 00)
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (_model.timerMilliseconds == 0) {
                        _model.timerController.onResetTimer();

                        _model.timerController.onStartTimer();
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
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Send again',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 17.0,
                                  letterSpacing: 0.0,
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
