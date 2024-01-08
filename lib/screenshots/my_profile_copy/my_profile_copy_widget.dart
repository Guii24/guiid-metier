import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_profile/empty_post_my_prof/empty_post_my_prof_widget.dart';
import '/post/component_post_reposted/component_post_reposted_widget.dart';
import '/post/component_post_user/component_post_user_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_profile_copy_model.dart';
export 'my_profile_copy_model.dart';

class MyProfileCopyWidget extends StatefulWidget {
  const MyProfileCopyWidget({Key? key}) : super(key: key);

  @override
  _MyProfileCopyWidgetState createState() => _MyProfileCopyWidgetState();
}

class _MyProfileCopyWidgetState extends State<MyProfileCopyWidget>
    with TickerProviderStateMixin {
  late MyProfileCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().profilePhoto = valueOrDefault<String>(
          currentUserPhoto,
          'https://firebasestorage.googleapis.com/v0/b/guiid-metier.appspot.com/o/Photo.png?alt=media&token=06d1ab4a-f642-4092-b1a7-9176c3b62d2f',
        );
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 2,
    )..addListener(() => setState(() {}));
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
            'MY PROFILE',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 45.0,
              icon: Icon(
                FFIcons.keditnewone,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.pushNamed('EditProfile');
              },
            ),
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 45.0,
              icon: Icon(
                FFIcons.ksetting,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 20.0,
              ),
              onPressed: () async {
                context.pushNamed('Settings');
              },
            ),
          ],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('EditProfile');
                        },
                        child: Container(
                          width: 80.0,
                          height: 80.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          Duration(milliseconds: 500),
                                      imageUrl: valueOrDefault<String>(
                                        currentUserPhoto,
                                        'https://plus.unsplash.com/premium_photo-1682097137926-f94ad95bfb71?auto=format&fit=crop&q=80&w=2787&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 24.0,
                                    height: 24.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        FFIcons.kplus,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 11.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sasha Green',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Libre Franklin',
                                      color:
                                          FlutterFlowTheme.of(context).dark88,
                                      fontSize: 19.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '24 years old  •  San Diego, CA',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 14.0,
                                            ),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 16.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 52.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).line,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: FutureBuilder<int>(
                                      future: queryPostRecordCount(
                                        queryBuilder: (postRecord) => postRecord
                                            .where(
                                              'post_creator',
                                              isEqualTo: currentUserReference,
                                            )
                                            .orderBy('post_time_posted',
                                                descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: CircularProgressIndicator(
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
                                        int textCount = snapshot.data!;
                                        return Text(
                                          '20',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color: Color(0xFF171A1F),
                                                fontSize: 15.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Posts',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: Color(0xFF9D9FA3),
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                              width: 1.0,
                              thickness: 1.0,
                              indent: 7.0,
                              endIndent: 7.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Followers');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '176',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color: Color(0xFF171A1F),
                                              fontSize: 15.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Followers',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: Color(0xFF9D9FA3),
                                            fontSize: 11.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            VerticalDivider(
                              width: 1.0,
                              thickness: 1.0,
                              indent: 7.0,
                              endIndent: 7.0,
                              color: FlutterFlowTheme.of(context).line,
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('Following');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '151',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color: Color(0xFF171A1F),
                                              fontSize: 15.0,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      'Following',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: Color(0xFF9D9FA3),
                                            fontSize: 11.0,
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
                ),
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0.0, 0),
                        child: TabBar(
                          labelColor: FlutterFlowTheme.of(context).dark88,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).dark88,
                          labelStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    fontSize: 17.0,
                                  ),
                          unselectedLabelStyle: TextStyle(),
                          indicatorColor:
                              FlutterFlowTheme.of(context).secondary,
                          indicatorWeight: 2.0,
                          tabs: [
                            Tab(
                              text: 'Posts',
                            ),
                            Tab(
                              text: 'About',
                            ),
                            Tab(
                              text: 'Wear',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}, () async {}, () async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            KeepAliveWidgetWrapper(
                              builder: (context) =>
                                  StreamBuilder<List<PostRecord>>(
                                stream: queryPostRecord(
                                  queryBuilder: (postRecord) => postRecord
                                      .where(
                                        'post_creator',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'post_type',
                                        isEqualTo: 'post',
                                      )
                                      .orderBy('post_time_posted',
                                          descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostRecord> listViewPostRecordList =
                                      snapshot.data!;
                                  if (listViewPostRecordList.isEmpty) {
                                    return Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.65,
                                      child: EmptyPostMyProfWidget(),
                                    );
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      16.0,
                                      0,
                                      35.0,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewPostRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 10.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewPostRecord =
                                          listViewPostRecordList[listViewIndex];
                                      return Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (!listViewPostRecord
                                                  .postIsReposted)
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
                                                    context.pushNamed(
                                                      'PostPage',
                                                      queryParameters: {
                                                        'postRef':
                                                            serializeParam(
                                                          listViewPostRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEBEBEB),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child:
                                                        ComponentPostUserWidget(
                                                      key: Key(
                                                          'Key3tu_${listViewIndex}_of_${listViewPostRecordList.length}'),
                                                      postDoc:
                                                          listViewPostRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                ),
                                              if (listViewPostRecord
                                                  .postIsReposted)
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
                                                    context.pushNamed(
                                                      'PostPageReposted',
                                                      queryParameters: {
                                                        'postRef':
                                                            serializeParam(
                                                          listViewPostRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFFEBEBEB),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child:
                                                        ComponentPostRepostedWidget(
                                                      key: Key(
                                                          'Keyanw_${listViewIndex}_of_${listViewPostRecordList.length}'),
                                                      postReposted:
                                                          listViewPostRecord
                                                              .reference,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        'About (bio)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark88,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    if (valueOrDefault(
                                                currentUserDocument?.userBio,
                                                '') !=
                                            null &&
                                        valueOrDefault(
                                                currentUserDocument?.userBio,
                                                '') !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument?.userBio,
                                                ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault(
                                                currentUserDocument?.userBio,
                                                '') ==
                                            null ||
                                        valueOrDefault(
                                                currentUserDocument?.userBio,
                                                '') ==
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            'Information is not available',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        'Preferences',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark88,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    if ((currentUserDocument?.userPreferences
                                                    ?.toList() ??
                                                [])
                                            .length !=
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Builder(
                                            builder: (context) {
                                              final preferences =
                                                  (currentUserDocument
                                                              ?.userPreferences
                                                              ?.toList() ??
                                                          [])
                                                      .toList();
                                              return Wrap(
                                                spacing: 10.0,
                                                runSpacing: 10.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    preferences.length,
                                                    (preferencesIndex) {
                                                  final preferencesItem =
                                                      preferences[
                                                          preferencesIndex];
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 0.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    child: Container(
                                                      height: 39.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .line,
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    8.0,
                                                                    12.0,
                                                                    8.0),
                                                        child: Text(
                                                          preferencesItem,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Libre Franklin',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dark88,
                                                                fontSize: 15.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if ((currentUserDocument?.userPreferences
                                                    ?.toList() ??
                                                [])
                                            .length ==
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            'Information is not available',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        'Education',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark88,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    if (valueOrDefault(
                                                currentUserDocument
                                                    ?.userEducation,
                                                '') !=
                                            null &&
                                        valueOrDefault(
                                                currentUserDocument
                                                    ?.userEducation,
                                                '') !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument
                                                    ?.userEducation,
                                                ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault(
                                                currentUserDocument
                                                    ?.userEducation,
                                                '') ==
                                            null ||
                                        valueOrDefault(
                                                currentUserDocument
                                                    ?.userEducation,
                                                '') ==
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            'Information is not available',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 8.0),
                                      child: Text(
                                        'Job',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark88,
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                    if (valueOrDefault(
                                                currentUserDocument?.userJob,
                                                '') ==
                                            null ||
                                        valueOrDefault(
                                                currentUserDocument?.userJob,
                                                '') ==
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 35.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            'Information is not available',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault(
                                                currentUserDocument?.userJob,
                                                '') !=
                                            null &&
                                        valueOrDefault(
                                                currentUserDocument?.userJob,
                                                '') !=
                                            '')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 35.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument?.userJob,
                                                ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            KeepAliveWidgetWrapper(
                              builder: (context) => Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 8.0),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1537832816519-689ad163238b?auto=format&fit=crop&q=80&w=1459&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1445205170230-053b83016050?auto=format&fit=crop&q=80&w=2942&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1557777586-f6682739fcf3?auto=format&fit=crop&q=80&w=2835&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?auto=format&fit=crop&q=80&w=2787&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1504198458649-3128b932f49e?auto=format&fit=crop&q=80&w=2840&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1525507119028-ed4c629a60a3?auto=format&fit=crop&q=80&w=1944&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1555529771-835f59fc5efe?auto=format&fit=crop&q=80&w=2787&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1495121605193-b116b5b9c5fe?auto=format&fit=crop&q=80&w=2788&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1492707892479-7bc8d5a4ee93?auto=format&fit=crop&q=80&w=1530&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1558769132-cb1aea458c5e?auto=format&fit=crop&q=80&w=1548&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1516762689617-e1cffcef479d?auto=format&fit=crop&q=80&w=2811&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1504198458649-3128b932f49e?auto=format&fit=crop&q=80&w=1587&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1572705824045-3dd0c9a47945?auto=format&fit=crop&q=80&w=1468&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1445205170230-053b83016050?auto=format&fit=crop&q=80&w=2942&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Image.network(
                                        'https://images.unsplash.com/photo-1562157873-818bc0726f68?auto=format&fit=crop&q=80&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                        width: 116.0,
                                        height: 113.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
