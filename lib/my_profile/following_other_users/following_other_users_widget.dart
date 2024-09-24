import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_profile/component_following/component_following_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'following_other_users_model.dart';
export 'following_other_users_model.dart';

class FollowingOtherUsersWidget extends StatefulWidget {
  const FollowingOtherUsersWidget({
    super.key,
    this.userDoc,
  });

  final UsersRecord? userDoc;

  @override
  State<FollowingOtherUsersWidget> createState() =>
      _FollowingOtherUsersWidgetState();
}

class _FollowingOtherUsersWidgetState extends State<FollowingOtherUsersWidget> {
  late FollowingOtherUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowingOtherUsersModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            'FOLLOWING',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: StreamBuilder<List<UsersRecord>>(
              stream: queryUsersRecord(
                queryBuilder: (usersRecord) => usersRecord
                    .where(
                      'email',
                      isNotEqualTo: null,
                    )
                    .where(
                      'user_followers',
                      arrayContains: widget!.userDoc?.reference,
                    ),
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
                List<UsersRecord> listViewUsersRecordList = snapshot.data!;

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    20.0,
                    0,
                    0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: listViewUsersRecordList.length,
                  separatorBuilder: (_, __) => SizedBox(height: 20.0),
                  itemBuilder: (context, listViewIndex) {
                    final listViewUsersRecord =
                        listViewUsersRecordList[listViewIndex];
                    return ComponentFollowingWidget(
                      key: Key(
                          'Key5dm_${listViewIndex}_of_${listViewUsersRecordList.length}'),
                      userRef: listViewUsersRecord.reference,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
