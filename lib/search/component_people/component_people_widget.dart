import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_people_model.dart';
export 'component_people_model.dart';

class ComponentPeopleWidget extends StatefulWidget {
  const ComponentPeopleWidget({
    super.key,
    required this.userDoc,
  });

  final UsersRecord? userDoc;

  @override
  State<ComponentPeopleWidget> createState() => _ComponentPeopleWidgetState();
}

class _ComponentPeopleWidgetState extends State<ComponentPeopleWidget> {
  late ComponentPeopleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentPeopleModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      valueOrDefault<String>(
                        widget.userDoc?.photoUrl,
                        'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          valueOrDefault<String>(
                            widget.userDoc?.displayName,
                            'name error',
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 3.0, 0.0, 0.0),
                          child: Text(
                            'Clothing brand manufacture',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark68,
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                        if (widget.userDoc?.userLocation != null &&
                            widget.userDoc?.userLocation != '')
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 3.0, 0.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.userDoc?.userLocation,
                                'location error',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark68,
                                    fontSize: 14.0,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (valueOrDefault(currentUserDocument?.userType, '') == 'User')
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (!(currentUserDocument?.userFollowing?.toList() ??
                                [])
                            .contains(widget.userDoc?.reference))
                          FFButtonWidget(
                            onPressed: () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'user_following': FieldValue.arrayUnion(
                                        [widget.userDoc?.reference]),
                                  },
                                ),
                              });

                              await widget.userDoc!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'user_followers': FieldValue.arrayUnion(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              await actions.updatePage(
                                context,
                              );

                              await NotificationRecord.collection
                                  .doc()
                                  .set(createNotificationRecordData(
                                    notificationFrom: currentUserReference,
                                    notificationType: 'following',
                                    notificationCreationDate:
                                        getCurrentTimestamp,
                                    notificationTo: widget.userDoc?.reference,
                                  ));
                              if (widget.userDoc!.userNotification) {
                                triggerPushNotification(
                                  notificationTitle: currentUserDisplayName,
                                  notificationText: 'started following you',
                                  userRefs: [widget.userDoc!.reference],
                                  initialPageName: 'MainPage',
                                  parameterData: {},
                                );
                              }
                            },
                            text: 'FOLLOW',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 33.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 14.0,
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).dark52,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        if ((currentUserDocument?.userFollowing?.toList() ?? [])
                            .contains(widget.userDoc?.reference))
                          FFButtonWidget(
                            onPressed: () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'user_following': FieldValue.arrayRemove(
                                        [widget.userDoc?.reference]),
                                  },
                                ),
                              });

                              await widget.userDoc!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'user_followers': FieldValue.arrayRemove(
                                        [currentUserReference]),
                                  },
                                ),
                              });
                              await actions.updatePage(
                                context,
                              );
                            },
                            text: 'FOLLOWING',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 33.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x0A000000),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark68,
                                    fontSize: 13.0,
                                    letterSpacing: 0.5,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(5.0),
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
