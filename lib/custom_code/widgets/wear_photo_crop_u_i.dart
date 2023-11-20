// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:typed_data';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:crop_your_image/crop_your_image.dart';
import 'package:path_provider/path_provider.dart';

import '/backend/firebase_storage/storage.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import '../../auth/firebase_auth/auth_util.dart';

class WearPhotoCropUI extends StatefulWidget {
  const WearPhotoCropUI({
    Key? key,
    this.width,
    this.height,
    required this.imageFile,
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.callBackAction,
  }) : super(key: key);

  final double? width;
  final double? height;
  final FFUploadedFile imageFile;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final Future<dynamic> Function() callBackAction;

  @override
  _WearPhotoCropUIState createState() => _WearPhotoCropUIState();
}

class _WearPhotoCropUIState extends State<WearPhotoCropUI> {
  late final CropController _cropController = CropController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional(0, 1),
      children: [
        Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 555,
          child: Center(
            child: Crop(
              fixArea: true,
              image: Uint8List.fromList(widget.imageFile.bytes!),
              controller: _cropController,
              onCropped: (image) async {
                final path = _getStoragePath(
                  _firebasePathPrefix(),
                  widget.imageFile.name!,
                  false,
                  0,
                );
                uploadData(path, image).then((value) {
                  FFAppState().update(() {
                    //  FFAppState().profilePhoto = value!;
                    //  FFAppState().addToWearItems(value!);
                    FFAppState().addToWearItems(WearItemsStruct(
                      wearImage: value!,
                    ));
                  });
                  print('image cropped');
                  widget.callBackAction.call();
                  setState(() {
                    loading = false;
                  });
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Loading',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                    duration: Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                  ),
                );
              },
              aspectRatio: 1 / 1,
              withCircleUi: false,
              initialAreaBuilder: (rect) => Rect.fromLTRB(
                rect.left + 4,
                rect.top + 125,
                rect.right - 4,
                rect.bottom - 125,
              ),

              baseColor: const Color.fromARGB(255, 0, 3, 22),
              // maskColor: Colors.white.withAlpha(100),
              radius: 8,
              onMoved: (_) {},
              onStatusChanged: (_) {},
              cornerDotBuilder: (double size, EdgeAlignment edgeAlignment) =>
                  Container(
                width: 0,
                height: 0,
              ),

              interactive: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(
              start: 16, top: 59, end: 16, bottom: 42),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    FFIcons.kchevronLeft,
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    size: 28,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 6, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'CANCEL',
                          options: FFButtonOptions(
                            height: 48,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(6, 0, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (!loading) {
                              setState(() {
                                loading = true;
                              });
                              _cropController.crop();
                            }
                            await Future.delayed(
                                const Duration(milliseconds: 1000));
                            Navigator.pop(context);
                          },
                          text: 'SAVE',
                          options: FFButtonOptions(
                            height: 48,
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 15,
                                ),
                            borderSide: BorderSide(
                              color: Colors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
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
      ],
    );
  }

  String _getStoragePath(
    String? pathPrefix,
    String filePath,
    bool isVideo, [
    int? index,
  ]) {
    pathPrefix ??= _firebasePathPrefix();
    pathPrefix = _removeTrailingSlash(pathPrefix);
    final timestamp = DateTime.now().microsecondsSinceEpoch;
    final prefix = 'cropped-';
    final ext = isVideo ? 'mp4' : filePath.split('.').last;
    final indexStr = index != null ? '_$index' : '';
    return '$pathPrefix/$prefix$timestamp$indexStr.$ext';
  }

  String? _removeTrailingSlash(String? path) =>
      path != null && path.endsWith('/')
          ? path.substring(0, path.length - 1)
          : path;

  String _firebasePathPrefix() => 'users/$currentUserUid/uploads';
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
