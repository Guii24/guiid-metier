import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_profile/component_follow/component_follow_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'followers_other_users_model.dart';
export 'followers_other_users_model.dart';

class FollowersOtherUsersWidget extends StatefulWidget {
  const FollowersOtherUsersWidget({
    Key? key,
    this.userDoc,
  }) : super(key: key);

  final UsersRecord? userDoc;

  @override
  _FollowersOtherUsersWidgetState createState() =>
      _FollowersOtherUsersWidgetState();
}

class _FollowersOtherUsersWidgetState extends State<FollowersOtherUsersWidget> {
  late FollowersOtherUsersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowersOtherUsersModel());
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
            'FOLLOWERS',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
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
            child: Builder(
              builder: (context) {
                final followersUser =
                    widget.userDoc?.userFollowers?.toList() ?? [];
                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    20.0,
                    0,
                    0,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: followersUser.length,
                  separatorBuilder: (_, __) => SizedBox(height: 20.0),
                  itemBuilder: (context, followersUserIndex) {
                    final followersUserItem = followersUser[followersUserIndex];
                    return ComponentFollowWidget(
                      key: Key(
                          'Keyz2e_${followersUserIndex}_of_${followersUser.length}'),
                      userRef: followersUserItem,
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
