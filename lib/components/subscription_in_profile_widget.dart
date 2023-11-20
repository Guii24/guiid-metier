import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_in_profile_model.dart';
export 'subscription_in_profile_model.dart';

class SubscriptionInProfileWidget extends StatefulWidget {
  const SubscriptionInProfileWidget({Key? key}) : super(key: key);

  @override
  _SubscriptionInProfileWidgetState createState() =>
      _SubscriptionInProfileWidgetState();
}

class _SubscriptionInProfileWidgetState
    extends State<SubscriptionInProfileWidget> {
  late SubscriptionInProfileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionInProfileModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResult7qk = await RevenueCatGroup.infoCall.call(
        userId: currentUserUid,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/Splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 44.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 60.0),
                    child: Text(
                      'Guiid\nMetier',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'NewYork',
                            color: FlutterFlowTheme.of(context).primary,
                            fontSize: 48.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                            lineHeight: 0.95,
                          ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.25,
                    child: Stack(
                      children: [
                        PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Icon(
                                      FFIcons.kproperty1post,
                                      color:
                                          FlutterFlowTheme.of(context).white88,
                                      size: 82.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90.0, 0.0, 90.0, 0.0),
                                    child: Text(
                                      'PUBLISH YOUR POSTS',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: 15.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w600,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'Company')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kicons25,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 82.0,
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'User')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kicons23,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 82.0,
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90.0, 0.0, 90.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                                    currentUserDocument
                                                        ?.userType,
                                                    '') ==
                                                'User'
                                            ? 'APPLY TO JOB LISTINGS'
                                            : 'POST YOUR JOBS',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 15.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'Company')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kproperty1aboutUs,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 80.0,
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'User')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kproperty1comments,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 82.0,
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90.0, 0.0, 90.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                                    currentUserDocument
                                                        ?.userType,
                                                    '') ==
                                                'User'
                                            ? 'ENGAGE WITH CONTENT'
                                            : 'REVIEW THE APPLICANTS',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 15.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'Company')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kproperty1comments,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 80.0,
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'User')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kproperty1Repost,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 82.0,
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90.0, 0.0, 90.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                                    currentUserDocument
                                                        ?.userType,
                                                    '') ==
                                                'User'
                                            ? 'SHARE YOUR THOUGHTS'
                                            : 'ENGAGE WITH CONTENT',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 15.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'User')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kicons7,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 80.0,
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault(
                                          currentUserDocument?.userType, '') ==
                                      'Company')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 16.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Icon(
                                          FFIcons.kproperty1Repost,
                                          color: FlutterFlowTheme.of(context)
                                              .white88,
                                          size: 82.0,
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90.0, 0.0, 90.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                                    currentUserDocument
                                                        ?.userType,
                                                    '') ==
                                                'User'
                                            ? 'BUILD YOUR WARDROBE'
                                            : 'SHARE YOUR THOUGHTS',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 15.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w600,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Spacer(flex: 2),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.80),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 5,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.SlideEffect(
                                spacing: 6.0,
                                radius: 6.0,
                                dotWidth: 6.0,
                                dotHeight: 6.0,
                                dotColor: FlutterFlowTheme.of(context).white20,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).white20,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Container(
                                        width: 38.0,
                                        height: 38.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFCF5B6),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Icon(
                                            FFIcons.kproperty1subscription,
                                            color: Colors.black,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Premium',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Libre Franklin',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontSize: 17.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .solidCheckCircle,
                                                  color: Color(0xFFFCF5B6),
                                                  size: 15.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Supscription plan',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .white52,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          RichText(
                                            textScaleFactor:
                                                MediaQuery.of(context)
                                                    .textScaleFactor,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.userType,
                                                              '') ==
                                                          'User'
                                                      ? revenue_cat
                                                          .offerings!
                                                          .current!
                                                          .monthly!
                                                          .storeProduct
                                                          .priceString
                                                      : revenue_cat
                                                          .offerings!.current!
                                                          .getPackage(
                                                              'Monthlycompany')!
                                                          .storeProduct
                                                          .price
                                                          .toString(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                TextSpan(
                                                  text: ' / mo',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            textAlign: TextAlign.end,
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                1.00, 0.00),
                                            child: Text(
                                              '7-days free trial',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Libre Franklin',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .white52,
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                height: 1.0,
                                thickness: 1.0,
                                color: Color(0x32FFFFFF),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'The next payment will be automatically charged on ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      TextSpan(
                                        text: functions.dateformatforSub(
                                            RevenueCatGroup.infoCall
                                                .expireDate(
                                                  (_model.apiResult7qk
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString()),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                        ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Text(
                      'Subscribed via ${isiOS ? 'Apple App Store' : 'Google Play'}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Libre Franklin',
                            color: Color(0x80FFFFFF),
                            fontSize: 14.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-1.00, -0.88),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(19.0, 0.0, 0.0, 0.0),
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: Icon(
                  FFIcons.kbiArrowLeft,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
