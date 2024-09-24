import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/company_pages/component_post_company/component_post_company_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/jobs/empty_jobs/empty_jobs_widget.dart';
import '/my_profile/empty_post_my_prof/empty_post_my_prof_widget.dart';
import '/post/component_post_reposted/component_post_reposted_widget.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_profile_company_model.dart';
export 'my_profile_company_model.dart';

class MyProfileCompanyWidget extends StatefulWidget {
  const MyProfileCompanyWidget({super.key});

  @override
  State<MyProfileCompanyWidget> createState() => _MyProfileCompanyWidgetState();
}

class _MyProfileCompanyWidgetState extends State<MyProfileCompanyWidget>
    with TickerProviderStateMixin {
  late MyProfileCompanyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyProfileCompanyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().profilePhotoCompany = currentUserPhoto;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
                context.pushNamed('EditProfileCompany');
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
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
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
                        context.pushNamed('EditProfileCompany');
                      },
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Stack(
                          children: [
                            AuthUserStreamWidget(
                              builder: (context) => Container(
                                width: 80.0,
                                height: 80.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CachedNetworkImage(
                                  fadeInDuration: Duration(milliseconds: 500),
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  imageUrl: valueOrDefault<String>(
                                    currentUserPhoto,
                                    'https://firebasestorage.googleapis.com/v0/b/guiid-metier-9e72a.appspot.com/o/Photo.png?alt=media&token=5b0e8f6e-7128-4456-a7d5-373cb8fa901b&_gl=1*rkimyz*_ga*MTM0NzUzNDc1NS4xNjg4NDU4OTk3*_ga_CW55HF8NVT*MTY5NjA5NDAyMC4xNzguMS4xNjk2MDk0MDc0LjYuMC4w',
                                  ),
                                  fit: BoxFit.cover,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      FFIcons.kplus,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthUserStreamWidget(
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                            currentUserDocument?.userLocation,
                                            ''),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
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
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FutureBuilder<int>(
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
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    int textCount = snapshot.data!;

                                    return Text(
                                      formatNumber(
                                        textCount,
                                        formatType: FormatType.compact,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: Color(0xFF171A1F),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  },
                                ),
                                Text(
                                  'Posts',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color: Color(0xFF9D9FA3),
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
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
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        formatNumber(
                                          (currentUserDocument?.userFollowers
                                                      ?.toList() ??
                                                  [])
                                              .length,
                                          formatType: FormatType.compact,
                                        ),
                                        '0',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: Color(0xFF171A1F),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
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
                                          letterSpacing: 0.0,
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
                                  letterSpacing: 0.0,
                                ),
                        unselectedLabelStyle: TextStyle(),
                        indicatorColor: FlutterFlowTheme.of(context).secondary,
                        indicatorWeight: 2.0,
                        tabs: [
                          Tab(
                            text: 'Posts',
                          ),
                          Tab(
                            text: 'About',
                          ),
                          Tab(
                            text: 'Jobs',
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
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewPostRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 10.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewPostRecord =
                                            listViewPostRecordList[
                                                listViewIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!listViewPostRecord
                                                .postIsReposted)
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .line,
                                                    width: 1.0,
                                                  ),
                                                ),
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
                                                  child:
                                                      ComponentPostCompanyWidget(
                                                    key: Key(
                                                        'Keyxa8_${listViewIndex}_of_${listViewPostRecordList.length}'),
                                                    postCompany:
                                                        listViewPostRecord
                                                            .reference,
                                                  ),
                                                ),
                                              ),
                                            if (listViewPostRecord
                                                .postIsReposted)
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .line,
                                                    width: 1.0,
                                                  ),
                                                ),
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
                                                  child:
                                                      ComponentPostRepostedWidget(
                                                    key: Key(
                                                        'Keyhv5_${listViewIndex}_of_${listViewPostRecordList.length}'),
                                                    postReposted:
                                                        listViewPostRecord
                                                            .reference,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
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
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                if (valueOrDefault(
                                            currentUserDocument?.userBio, '') !=
                                        null &&
                                    valueOrDefault(
                                            currentUserDocument?.userBio, '') !=
                                        '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                            currentUserDocument?.userBio, ''),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                if (valueOrDefault(
                                            currentUserDocument?.userBio, '') ==
                                        null ||
                                    valueOrDefault(
                                            currentUserDocument?.userBio, '') ==
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
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
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
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
                                          final prefs = (currentUserDocument
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
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: List.generate(
                                                prefs.length, (prefsIndex) {
                                              final prefsItem =
                                                  prefs[prefsIndex];
                                              return Material(
                                                color: Colors.transparent,
                                                elevation: 0.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Container(
                                                  height: 39.0,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .line,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 8.0,
                                                                12.0, 8.0),
                                                    child: Text(
                                                      prefsItem,
                                                      textAlign:
                                                          TextAlign.center,
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
                                                                letterSpacing:
                                                                    0.0,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark68,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 16.0),
                                  child: Text(
                                    'Contact',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          FFIcons.kproperty1phone,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => Text(
                                          '${valueOrDefault(currentUserDocument?.userContactDialCode, '')}${valueOrDefault(currentUserDocument?.userContactPhone, '')}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark68,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                      if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.userContactPhone,
                                                  '') ==
                                              null ||
                                          valueOrDefault(
                                                  currentUserDocument
                                                      ?.userContactPhone,
                                                  '') ==
                                              '')
                                        AuthUserStreamWidget(
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
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 40.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Icon(
                                          FFIcons.kproperty1email,
                                          color: Colors.black,
                                          size: 24.0,
                                        ),
                                      ),
                                      if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.userEmail,
                                                  '') !=
                                              null &&
                                          valueOrDefault(
                                                  currentUserDocument
                                                      ?.userEmail,
                                                  '') !=
                                              '')
                                        AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            valueOrDefault(
                                                currentUserDocument?.userEmail,
                                                ''),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .dark68,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.userEmail,
                                                  '') ==
                                              null ||
                                          valueOrDefault(
                                                  currentUserDocument
                                                      ?.userEmail,
                                                  '') ==
                                              '')
                                        AuthUserStreamWidget(
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
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<List<JobRecord>>(
                            stream: _model.jobs(
                              overrideCache: true,
                              requestFn: () => queryJobRecord(
                                queryBuilder: (jobRecord) => jobRecord.where(
                                  'company_creator',
                                  isEqualTo: currentUserReference,
                                ),
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
                              List<JobRecord> listViewJobRecordList =
                                  snapshot.data!;
                              if (listViewJobRecordList.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    child: EmptyJobsWidget(),
                                  ),
                                );
                              }

                              return ListView.separated(
                                padding: EdgeInsets.fromLTRB(
                                  0,
                                  16.0,
                                  0,
                                  35.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: listViewJobRecordList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 10.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewJobRecord =
                                      listViewJobRecordList[listViewIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        'SourcingMyJobDetails',
                                        queryParameters: {
                                          'jobDoc': serializeParam(
                                            listViewJobRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'jobDoc': listViewJobRecord,
                                        },
                                      );
                                    },
                                    child: ComponentSourcingWidget(
                                      key: Key(
                                          'Keywfc_${listViewIndex}_of_${listViewJobRecordList.length}'),
                                      jobDoc: listViewJobRecord,
                                    ),
                                  );
                                },
                              );
                            },
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
    );
  }
}
