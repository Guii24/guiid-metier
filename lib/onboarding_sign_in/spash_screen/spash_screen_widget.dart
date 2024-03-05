import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'spash_screen_model.dart';
export 'spash_screen_model.dart';

class SpashScreenWidget extends StatefulWidget {
  const SpashScreenWidget({super.key});

  @override
  State<SpashScreenWidget> createState() => _SpashScreenWidgetState();
}

class _SpashScreenWidgetState extends State<SpashScreenWidget> {
  late SpashScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SpashScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
      await Future.delayed(const Duration(milliseconds: 1000));
      if (isiOS || isAndroid) {
        if (!valueOrDefault<bool>(
            currentUserDocument?.userBlockedUserByAdmin, false)) {
          final isEntitled = await revenue_cat.isEntitled('Premium') ?? false;
          if (!isEntitled) {
            await revenue_cat.loadOfferings();
          }

          if (!isEntitled) {
            await currentUserReference!.update(createUsersRecordData(
              userSubscription: false,
            ));
          }
        }
      }

      context.goNamed(
        'MainPage',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.fade,
            duration: Duration(milliseconds: 0),
          ),
        },
      );
    });
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
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/Spash.png',
                ).image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
