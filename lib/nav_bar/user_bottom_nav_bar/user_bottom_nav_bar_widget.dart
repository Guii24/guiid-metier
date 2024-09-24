import '/auth/firebase_auth/auth_util.dart';
import '/components/subscription_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_bottom_nav_bar_model.dart';
export 'user_bottom_nav_bar_model.dart';

class UserBottomNavBarWidget extends StatefulWidget {
  const UserBottomNavBarWidget({super.key});

  @override
  State<UserBottomNavBarWidget> createState() => _UserBottomNavBarWidgetState();
}

class _UserBottomNavBarWidgetState extends State<UserBottomNavBarWidget> {
  late UserBottomNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserBottomNavBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          Navigator.pop(context);
        },
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          child: Stack(
            children: [
              if (isWeb || isAndroid)
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.09,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15.0,
                                  color: Color(0x13000000),
                                  offset: Offset(
                                    0.0,
                                    -6.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Articles';
                                      FFAppState().pageIndex = 0;
                                      FFAppState().update(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FFIcons.kdocuments1,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Articles'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Articles',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Articles'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Posts';
                                      FFAppState().pageIndex = 1;
                                      FFAppState().update(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FFIcons.kdocuments,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Posts'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Posts',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Posts'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Sourcing';
                                      FFAppState().pageIndex = 2;
                                      FFAppState().update(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kproperty1job,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Sourcing'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Sourcing',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Sourcing'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Directory';
                                      FFAppState().pageIndex = 3;
                                      FFAppState().update(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kloupeDocumentSearch,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Directory'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Directory',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Directory'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.91),
                        child: Container(
                          width: 66.0,
                          height: 66.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15.0,
                                color: Color(0x13000000),
                                offset: Offset(
                                  0.0,
                                  -6.0,
                                ),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              width: 56.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kplus,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (valueOrDefault(currentUserDocument?.userType, '') ==
                          'User')
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.66),
                          child: AuthUserStreamWidget(
                            builder: (context) => Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: 200.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: Color(0xF2FFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 64.0,
                                      color: Color(0x19000000),
                                      offset: Offset(
                                        0.0,
                                        8.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);
                                            FFAppState().choosenPreference = [];
                                            FFAppState().choosenPurpose = '';
                                            safeSetState(() {});

                                            context.pushNamed('CreatePost');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'New post',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1post,
                                              color: Colors.black,
                                              size: 22.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: Color(0x403C3C43),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);

                                            context.pushNamed('CreateWear');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'New wear',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1wardrobe,
                                              color: Colors.black,
                                              size: 22.0,
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
                        ),
                      if (valueOrDefault(currentUserDocument?.userType, '') !=
                          'User')
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.66),
                          child: AuthUserStreamWidget(
                            builder: (context) => Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: 200.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: Color(0xF2FFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 64.0,
                                      color: Color(0x19000000),
                                      offset: Offset(
                                        0.0,
                                        8.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);
                                            FFAppState().choosenPreference = [];
                                            FFAppState().choosenPurpose = '';
                                            safeSetState(() {});

                                            context.pushNamed('CreatePost');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'New post',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1post,
                                              color: Colors.black,
                                              size: 22.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: Color(0x403C3C43),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);
                                            if (Navigator.of(context)
                                                .canPop()) {
                                              context.pop();
                                            }
                                            context.pushNamed('PostJobPage');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'Post a job/resource',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1job,
                                              color: Colors.black,
                                              size: 22.0,
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
                        ),
                    ],
                  ),
                ),
              if (isiOS)
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).height * 0.105,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 15.0,
                                  color: Color(0x13000000),
                                  offset: Offset(
                                    0.0,
                                    -6.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Articles';
                                      FFAppState().pageIndex = 0;
                                      FFAppState().update(() {});
                                    },
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FFIcons.kdocuments1,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Articles'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Articles',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Articles'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Posts';
                                      FFAppState().pageIndex = 1;
                                      FFAppState().update(() {});
                                    },
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FFIcons.kdocuments,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Posts'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Posts',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Posts'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 70.0,
                                  height: 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Sourcing';
                                      FFAppState().pageIndex = 2;
                                      FFAppState().update(() {});
                                    },
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kproperty1job,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Sourcing'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Sourcing',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Sourcing'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.5, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().page = 'Directory';
                                      FFAppState().pageIndex = 3;
                                      FFAppState().update(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            FFIcons.kloupeDocumentSearch,
                                            color: valueOrDefault<Color>(
                                              FFAppState().page == 'Directory'
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .dark38,
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                            ),
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Text(
                                              'Directory',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        'Libre Franklin',
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().page ==
                                                              'Directory'
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .dark38,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .dark38,
                                                    ),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.88),
                        child: Container(
                          width: 66.0,
                          height: 66.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15.0,
                                color: Color(0x13000000),
                                offset: Offset(
                                  0.0,
                                  -6.0,
                                ),
                              )
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              width: 56.0,
                              height: 56.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                FFIcons.kplus,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (valueOrDefault(currentUserDocument?.userType, '') ==
                          'User')
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.65),
                          child: AuthUserStreamWidget(
                            builder: (context) => Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: 200.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: Color(0xF2FFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 64.0,
                                      color: Color(0x19000000),
                                      offset: Offset(
                                        0.0,
                                        8.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);
                                            FFAppState().choosenPreference = [];
                                            FFAppState().choosenPurpose = '';
                                            safeSetState(() {});

                                            context.pushNamed('CreatePost');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'New post',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1post,
                                              color: Colors.black,
                                              size: 22.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: Color(0x403C3C43),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);

                                            context.pushNamed('CreateWear');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'New wear',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1wardrobe,
                                              color: Colors.black,
                                              size: 22.0,
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
                        ),
                      if (valueOrDefault(currentUserDocument?.userType, '') !=
                          'User')
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.65),
                          child: AuthUserStreamWidget(
                            builder: (context) => Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                width: 200.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: Color(0xF2FFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 64.0,
                                      color: Color(0x19000000),
                                      offset: Offset(
                                        0.0,
                                        8.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);
                                            FFAppState().choosenPreference = [];
                                            FFAppState().choosenPurpose = '';
                                            safeSetState(() {});

                                            context.pushNamed('CreatePost');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'New post',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1post,
                                              color: Colors.black,
                                              size: 22.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1.0,
                                      thickness: 1.0,
                                      color: Color(0x403C3C43),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.userBlockedUserByAdmin,
                                            false)) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Your account has been suspended. Please, contact support.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 3000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        } else {
                                          if (valueOrDefault<bool>(
                                              currentUserDocument
                                                  ?.userSubscription,
                                              false)) {
                                            Navigator.pop(context);

                                            context.pushNamed('PostJobPage');
                                          } else {
                                            showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor:
                                                  FlutterFlowTheme.of(context)
                                                      .customColorBottomSh,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: SubscriptionWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 13.0, 0.0, 13.0),
                                            child: Text(
                                              'Post a job/resource',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: Icon(
                                              FFIcons.kproperty1job,
                                              color: Colors.black,
                                              size: 22.0,
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
