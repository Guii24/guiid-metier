import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/post/create_post/botton_select_category/botton_select_category_widget.dart';
import '/post/create_post/custom_dialog_create_post/custom_dialog_create_post_widget.dart';
import '/post/create_post/popup_cancel/popup_cancel_widget.dart';
import '/post/take_photo_p_post_user/take_photo_p_post_user_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_post_model.dart';
export 'create_post_model.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({super.key});

  @override
  State<CreatePostWidget> createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget> {
  late CreatePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().choosenPreference = [];
      FFAppState().uploadPhotoPost = [];
      FFAppState().choosenPurpose = '';
      safeSetState(() {});

      safeSetState(() {});
      safeSetState(() {
        _model.textController?.clear();
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
          leading: Builder(
            builder: (context) => FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderWidth: 1.0,
              buttonSize: 54.0,
              icon: Icon(
                FFIcons.kdismiss,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                await showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => FocusScope.of(dialogContext).unfocus(),
                        child: PopupCancelWidget(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          title: Text(
            'NEW POST',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) => Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where(
                        'user_following',
                        arrayContains: currentUserReference,
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
                      List<UsersRecord> buttonUsersRecordList = snapshot.data!;

                      return FFButtonWidget(
                        onPressed: ((_model.textController.text == null ||
                                    _model.textController.text == '') ||
                                (FFAppState().choosenPreference.length == 0))
                            ? null
                            : () async {
                                if ((_model.textController.text != null &&
                                        _model.textController.text != '') &&
                                    (FFAppState()
                                            .choosenPurposeAndPref
                                            .length !=
                                        null)) {
                                  await PostRecord.collection.doc().set({
                                    ...createPostRecordData(
                                      postText: _model.textController.text,
                                      postTimePosted: getCurrentTimestamp,
                                      postCreator: currentUserReference,
                                      postIsReposted: false,
                                      postType: 'post',
                                      postBlocked: false,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'post_images_list':
                                            FFAppState().uploadPhotoPost,
                                        'post_category': functions.createList(
                                            FFAppState().choosenPurpose,
                                            FFAppState()
                                                .choosenPreference
                                                .toList()),
                                      },
                                    ),
                                  });

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

                                  FFAppState().uploadPhotoPost = [];
                                  FFAppState().choosenPreference = [];
                                  FFAppState().choosenPurpose = '';
                                  FFAppState().choosenPurposeAndPref = [];
                                  safeSetState(() {});
                                  showDialog(
                                    barrierColor: Color(0x02000000),
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, -1.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: CustomDialogCreatePostWidget(),
                                        ),
                                      );
                                    },
                                  );

                                  await NotificationRecord.collection
                                      .doc()
                                      .set(createNotificationRecordData(
                                        notificationFrom: currentUserReference,
                                        notificationTo: buttonUsersRecordList
                                            .where((e) =>
                                                e.userNotification == true)
                                            .toList()[
                                                buttonUsersRecordList.length]
                                            .reference,
                                        notificationType: 'published post',
                                        notificationCreationDate:
                                            getCurrentTimestamp,
                                      ));
                                  triggerPushNotification(
                                    notificationTitle: currentUserDisplayName,
                                    notificationText: 'published the post',
                                    userRefs: buttonUsersRecordList
                                        .where(
                                            (e) => e.userNotification == true)
                                        .toList()
                                        .map((e) => e.reference)
                                        .toList(),
                                    initialPageName: 'MainPage',
                                    parameterData: {},
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Description and Category must be filled in',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).dark52,
                                    ),
                                  );
                                }
                              },
                        text: 'POST',
                        options: FFButtonOptions(
                          width: 59.0,
                          height: 27.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                          disabledTextColor:
                              FlutterFlowTheme.of(context).primary,
                        ),
                      );
                    },
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
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (FFAppState().uploadPhotoPost.length >= 1)
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.69,
                          child: Stack(
                            children: [
                              Builder(
                                builder: (context) {
                                  final images =
                                      FFAppState().uploadPhotoPost.toList();

                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: PageView.builder(
                                      controller: _model.pageViewController ??=
                                          PageController(
                                              initialPage: max(0,
                                                  min(0, images.length - 1))),
                                      onPageChanged: (_) => safeSetState(() {}),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      itemBuilder: (context, imagesIndex) {
                                        final imagesItem = images[imagesIndex];
                                        return ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0.0),
                                            bottomRight: Radius.circular(0.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(5.0),
                                          ),
                                          child: Image.network(
                                            imagesItem,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              if (FFAppState().uploadPhotoPost.length > 1)
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 16.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Container(
                                        width: 35.0,
                                        height: 28.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .dark20,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Text(
                                            '${(_model.pageViewCurrentIndex + 1).toString()}/${FFAppState().uploadPhotoPost.length.toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Libre Franklin',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 16.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: const CircleBorder(),
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(context).dark20,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            FFAppState()
                                                .removeAtIndexFromUploadPhotoPost(
                                                    _model
                                                        .pageViewCurrentIndex);
                                            safeSetState(() {});
                                          },
                                          child: Icon(
                                            FFIcons.kproperty1trash,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 22.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController,
                            focusNode: _model.textFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController',
                              Duration(milliseconds: 10),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark38,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4.0),
                                  topRight: Radius.circular(4.0),
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark68,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  lineHeight: 1.4,
                                ),
                            maxLines: 15,
                            validator: _model.textControllerValidator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^.{1,2200}'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().uploadPhotoPost.length == 5) {
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
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: TakePhotoPPostUserWidget(),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
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
                                      color: Colors.black,
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
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Color(0x01000000),
                                barrierColor:
                                    FlutterFlowTheme.of(context).dark38,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () =>
                                        FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BottonSelectCategoryWidget(),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
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
                                      12.0, 0.0, 6.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      if (functions
                                              .createList(
                                                  FFAppState().choosenPurpose,
                                                  FFAppState()
                                                      .choosenPreference
                                                      .toList())
                                              ?.length ==
                                          null)
                                        Text(
                                          'Category',
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Libre Franklin',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .dark88,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      if (functions
                                              .createList(
                                                  FFAppState().choosenPurpose,
                                                  FFAppState()
                                                      .choosenPreference
                                                      .toList())
                                              ?.length !=
                                          null)
                                        Flexible(
                                          child: Builder(
                                            builder: (context) {
                                              final item = functions
                                                      .createList(
                                                          FFAppState()
                                                              .choosenPurpose,
                                                          FFAppState()
                                                              .choosenPreference
                                                              .toList())
                                                      ?.toList() ??
                                                  [];

                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: List.generate(
                                                      item.length, (itemIndex) {
                                                    final itemItem =
                                                        item[itemIndex];
                                                    return Text(
                                                      itemIndex ==
                                                              (functions
                                                                      .createList(
                                                                          FFAppState()
                                                                              .choosenPurpose,
                                                                          FFAppState()
                                                                              .choosenPreference
                                                                              .toList())!
                                                                      .length -
                                                                  1)
                                                          ? itemItem
                                                          : '${itemItem}, ',
                                                      maxLines: 1,
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
                                                    );
                                                  }),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kchevronBottomSm,
                                          color: FlutterFlowTheme.of(context)
                                              .dark88,
                                          size: 22.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
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
