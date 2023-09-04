import '/articles/articles_component/articles_component_widget.dart';
import '/backend/backend.dart';
import '/company_pages/component_companies/component_companies_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/post/post_types_for_search/post_types_for_search_widget.dart';
import '/search/component_people/component_people_widget.dart';
import '/sourcing/bottom_job_details/bottom_job_details_widget.dart';
import '/sourcing/component_sourcing/component_sourcing_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_result_page_model.dart';
export 'search_result_page_model.dart';

class SearchResultPageWidget extends StatefulWidget {
  const SearchResultPageWidget({
    Key? key,
    required this.searchingText,
  }) : super(key: key);

  final String? searchingText;

  @override
  _SearchResultPageWidgetState createState() => _SearchResultPageWidgetState();
}

class _SearchResultPageWidgetState extends State<SearchResultPageWidget>
    with TickerProviderStateMixin {
  late SearchResultPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    );
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
            widget.searchingText!.maybeHandleOverflow(
              maxChars: 30,
              replacement: '…',
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: StreamBuilder<List<UsersRecord>>(
          stream: queryUsersRecord(),
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
            List<UsersRecord> containerUsersRecordList = snapshot.data!;
            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFEBE9DF),
                    FlutterFlowTheme.of(context).primary
                  ],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(-1.0, 0),
                    child: FlutterFlowButtonTabBar(
                      useToggleButtonStyle: false,
                      isScrollable: true,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Libre Franklin',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                              ),
                      unselectedLabelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Libre Franklin',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal,
                              ),
                      labelColor: FlutterFlowTheme.of(context).primary,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).primaryText,
                      backgroundColor: FlutterFlowTheme.of(context).primaryText,
                      borderColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedBorderColor:
                          FlutterFlowTheme.of(context).primaryText,
                      borderWidth: 1.0,
                      borderRadius: 8.0,
                      elevation: 0.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      buttonMargin:
                          EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 0.0),
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 4.0),
                      tabs: [
                        Tab(
                          text: 'People',
                        ),
                        Tab(
                          text: 'Companies',
                        ),
                        Tab(
                          text: 'Articles',
                        ),
                        Tab(
                          text: 'Posts',
                        ),
                        Tab(
                          text: 'Jobs',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (value) => setState(() {}),
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 15.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final users = functions
                                    .searchUser(
                                        widget.searchingText!,
                                        containerUsersRecordList
                                            .where((e) => e.userType == 'User')
                                            .toList())
                                    .toList();
                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    20.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: users.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.0),
                                  itemBuilder: (context, usersIndex) {
                                    final usersItem = users[usersIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'OtherProfile',
                                          queryParameters: {
                                            'userRef': serializeParam(
                                              usersItem.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ComponentPeopleWidget(
                                        key: Key(
                                            'Key8th_${usersIndex}_of_${users.length}'),
                                        userDoc: usersItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 15.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final company = functions
                                    .searchUser(
                                        widget.searchingText!,
                                        containerUsersRecordList
                                            .where(
                                                (e) => e.userType == 'Company')
                                            .toList())
                                    .toList();
                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    20.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: company.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 16.0),
                                  itemBuilder: (context, companyIndex) {
                                    final companyItem = company[companyIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'OtherProfileCompany',
                                          queryParameters: {
                                            'userRef': serializeParam(
                                              companyItem.reference,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ComponentCompaniesWidget(
                                        key: Key(
                                            'Keyo5i_${companyIndex}_of_${company.length}'),
                                        companyDoc: companyItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: StreamBuilder<List<ArticlesRecord>>(
                              stream: queryArticlesRecord(),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<ArticlesRecord>
                                    containerArticlesRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 15.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final articles = functions
                                            .searchArticles(
                                                widget.searchingText!,
                                                containerArticlesRecordList
                                                    .toList())
                                            .toList();
                                        return ListView.separated(
                                          padding: EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            20.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: articles.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 15.0),
                                          itemBuilder:
                                              (context, articlesIndex) {
                                            final articlesItem =
                                                articles[articlesIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'ArticlePage',
                                                  queryParameters: {
                                                    'article': serializeParam(
                                                      articlesItem.reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: ArticlesComponentWidget(
                                                key: Key(
                                                    'Key7uc_${articlesIndex}_of_${articles.length}'),
                                                articleDoc:
                                                    articlesItem.reference,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 15.0, 16.0, 0.0),
                            child: StreamBuilder<List<PostRecord>>(
                              stream: queryPostRecord(),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<PostRecord> containerPostRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final posts = functions
                                          .searchPosts(widget.searchingText!,
                                              containerPostRecordList.toList())
                                          .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: posts.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 10.0),
                                        itemBuilder: (context, postsIndex) {
                                          final postsItem = posts[postsIndex];
                                          return PostTypesForSearchWidget(
                                            key: Key(
                                                'Keyyf5_${postsIndex}_of_${posts.length}'),
                                            postDoc: postsItem,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        KeepAliveWidgetWrapper(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 15.0, 16.0, 0.0),
                            child: StreamBuilder<List<JobRecord>>(
                              stream: queryJobRecord(),
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<JobRecord> containerJobRecordList =
                                    snapshot.data!;
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final jobs = functions
                                          .searchJob(widget.searchingText!,
                                              containerJobRecordList.toList())
                                          .toList();
                                      return ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: jobs.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 15.0),
                                        itemBuilder: (context, jobsIndex) {
                                          final jobsItem = jobs[jobsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Color(0x01000000),
                                                barrierColor:
                                                    FlutterFlowTheme.of(context)
                                                        .dark38,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => FocusScope.of(
                                                            context)
                                                        .requestFocus(
                                                            _model.unfocusNode),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          BottomJobDetailsWidget(
                                                        jobDoc: jobsItem,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: ComponentSourcingWidget(
                                              key: Key(
                                                  'Key130_${jobsIndex}_of_${jobs.length}'),
                                              jobDoc: jobsItem,
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
