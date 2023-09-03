import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_logout_model.dart';
export 'popup_logout_model.dart';

class PopupLogoutWidget extends StatefulWidget {
  const PopupLogoutWidget({Key? key}) : super(key: key);

  @override
  _PopupLogoutWidgetState createState() => _PopupLogoutWidgetState();
}

class _PopupLogoutWidgetState extends State<PopupLogoutWidget> {
  late PopupLogoutModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupLogoutModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: double.infinity,
          height: 180.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 20.0),
                  child: Text(
                    'Are your sure you want to log out?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Libre Franklin',
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          lineHeight: 1.5,
                        ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'NO',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(7.0, 0.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            GoRouter.of(context).prepareAuthEvent();
                            await authManager.signOut();
                            GoRouter.of(context).clearRedirectLocation();

                            setState(() {
                              FFAppState().selectedlocation = '';
                              FFAppState().postreport = [];
                              FFAppState().popupSelected = '';
                              FFAppState().profilePhoto = '';
                              FFAppState().countryInfo = jsonDecode(
                                  '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
                              FFAppState().profilePhotoCompany = '';
                              FFAppState().choosenPreference = [];
                              FFAppState().activeCalendar = false;
                              FFAppState().page = 'Articles';
                              FFAppState().pageIndex = 0;
                              FFAppState().countryInfoCompany = jsonDecode(
                                  '{\"name\":\"United States\",\"flag\":\"🇺🇸\",\"code\":\"US\",\"dial_code\":\"+1\"}');
                            });

                            context.goNamedAuth('Onboarding', context.mounted);
                          },
                          text: 'YES',
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
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
