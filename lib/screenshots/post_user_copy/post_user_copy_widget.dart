import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/screenshots/component_post_user_copy/component_post_user_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_user_copy_model.dart';
export 'post_user_copy_model.dart';

class PostUserCopyWidget extends StatefulWidget {
  const PostUserCopyWidget({super.key});

  @override
  State<PostUserCopyWidget> createState() => _PostUserCopyWidgetState();
}

class _PostUserCopyWidgetState extends State<PostUserCopyWidget> {
  late PostUserCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostUserCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 110.0,
              pinned: false,
              floating: true,
              snap: true,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Align(
                  alignment: AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 30.0, 8.0, 17.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.network(
                                    'https://plus.unsplash.com/premium_photo-1682097137926-f94ad95bfb71?auto=format&fit=crop&q=80&w=2787&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                    width: 34.0,
                                    height: 34.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'Guiid Metier',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'NewYork',
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    FFIcons.kproperty1notification,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('Notifications');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.choosenCategory = '';
                                    safeSetState(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Container(
                                      height: 35.0,
                                      decoration: BoxDecoration(
                                        color: _model.choosenCategory == null ||
                                                _model.choosenCategory == ''
                                            ? FlutterFlowTheme.of(context)
                                                .primaryText
                                            : FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 5.0, 12.0, 5.0),
                                          child: Text(
                                            'All',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color:
                                                      _model.choosenCategory ==
                                                                  null ||
                                                              _model.choosenCategory ==
                                                                  ''
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) => Builder(
                                    builder: (context) {
                                      final category = (currentUserDocument
                                                  ?.userPreferences
                                                  ?.toList() ??
                                              [])
                                          .toList();

                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(category.length,
                                                (categoryIndex) {
                                          final categoryItem =
                                              category[categoryIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.choosenCategory =
                                                  categoryItem;
                                              safeSetState(() {});
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              child: Container(
                                                height: 35.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    _model.choosenCategory ==
                                                            categoryItem
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 5.0,
                                                                12.0, 5.0),
                                                    child: Text(
                                                      categoryItem,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Libre Franklin',
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              _model.choosenCategory ==
                                                                      categoryItem
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                            ),
                                                            fontSize: 15.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        })
                                            .divide(SizedBox(width: 8.0))
                                            .addToStart(SizedBox(width: 8.0))
                                            .addToEnd(SizedBox(width: 8.0)),
                                      );
                                    },
                                  ),
                                ),
                              ].addToStart(SizedBox(width: 16.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 1.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return Container(
                width: double.infinity,
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
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: StreamBuilder<List<PostRecord>>(
                          stream: queryPostRecord(
                            queryBuilder: (postRecord) => postRecord
                                .where(
                                  'post_category',
                                  arrayContains: _model.choosenCategory != ''
                                      ? _model.choosenCategory
                                      : null,
                                )
                                .orderBy('post_time_posted', descending: true),
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
                            List<PostRecord> listViewPostRecordList =
                                snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                10.0,
                                0,
                                0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewPostRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 10.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewPostRecord =
                                    listViewPostRecordList[listViewIndex];
                                return ComponentPostUserCopyWidget(
                                  key: Key(
                                      'Key7l0_${listViewIndex}_of_${listViewPostRecordList.length}'),
                                  postDoc: listViewPostRecord.reference,
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
