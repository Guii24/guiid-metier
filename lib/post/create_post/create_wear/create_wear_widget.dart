import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/post/create_post/component_wear/component_wear_widget.dart';
import '/post/create_post/empty_create_wear/empty_create_wear_widget.dart';
import '/post/create_post/popup_cancel/popup_cancel_widget.dart';
import '/post/take_photo_wear/take_photo_wear_widget.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_wear_model.dart';
export 'create_wear_model.dart';

class CreateWearWidget extends StatefulWidget {
  const CreateWearWidget({Key? key}) : super(key: key);

  @override
  _CreateWearWidgetState createState() => _CreateWearWidgetState();
}

class _CreateWearWidgetState extends State<CreateWearWidget> {
  late CreateWearModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateWearModel());
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
          leading: Builder(
            builder: (context) => FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 54.0,
              icon: Icon(
                FFIcons.kdismiss,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await showAlignedDialog(
                  context: context,
                  isGlobal: true,
                  avoidOverflow: false,
                  targetAnchor: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  followerAnchor: AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  builder: (dialogContext) {
                    return Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () => FocusScope.of(context)
                            .requestFocus(_model.unfocusNode),
                        child: PopupCancelWidget(),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              },
            ),
          ),
          title: Text(
            'NEW WEAR',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontSize: 16.0,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                child: FFButtonWidget(
                  onPressed: FFAppState().wearItems.length == 0
                      ? null
                      : () async {
                          await Future.delayed(
                              const Duration(milliseconds: 1000));

                          await PostRecord.collection.doc().set({
                            ...createPostRecordData(
                              postTimePosted: getCurrentTimestamp,
                              postCreator: currentUserReference,
                              postType: 'wear',
                            ),
                            'post_wear_items': getWearItemsListFirestoreData(
                              FFAppState().wearItems,
                            ),
                          });
                          setState(() {
                            FFAppState().wearItems = [];
                          });
                          context.safePop();
                        },
                  text: 'POST',
                  options: FFButtonOptions(
                    width: 59.0,
                    height: 27.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryText,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Libre Franklin',
                          color: Colors.white,
                          fontSize: 12.0,
                          letterSpacing: 0.5,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(5.0),
                    disabledColor: Color(0xFFC9C9C9),
                    disabledTextColor: FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final wear =
                        FFAppState().wearItems.toList().take(5).toList();
                    if (wear.isEmpty) {
                      return Center(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          child: EmptyCreateWearWidget(),
                        ),
                      );
                    }
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        0,
                        0,
                        16.0,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: wear.length,
                      separatorBuilder: (_, __) => SizedBox(height: 32.0),
                      itemBuilder: (context, wearIndex) {
                        final wearItem = wear[wearIndex];
                        return ComponentWearWidget(
                          key: Key('Keyj6s_${wearIndex}_of_${wear.length}'),
                          wearItem: wearItem,
                          index: wearIndex,
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().wearItems.length == 5) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Max 5 images',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                duration: Duration(milliseconds: 3000),
                                backgroundColor: Color(0xCB000000),
                              ),
                            );
                          } else {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Color(0x01000000),
                              barrierColor: FlutterFlowTheme.of(context).dark38,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: TakePhotoWearWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          }
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Container(
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).dark12,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      FFIcons.kicons1,
                                      color:
                                          FlutterFlowTheme.of(context).dark88,
                                      size: 22.0,
                                    ),
                                  ),
                                  Text(
                                    'Photo',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          fontSize: 15.0,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
