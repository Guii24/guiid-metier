import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'take_photo_p_post_user_model.dart';
export 'take_photo_p_post_user_model.dart';

class TakePhotoPPostUserWidget extends StatefulWidget {
  const TakePhotoPPostUserWidget({Key? key}) : super(key: key);

  @override
  _TakePhotoPPostUserWidgetState createState() =>
      _TakePhotoPPostUserWidgetState();
}

class _TakePhotoPPostUserWidgetState extends State<TakePhotoPPostUserWidget> {
  late TakePhotoPPostUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TakePhotoPPostUserModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: Color(0xB2F5F5F5),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia = await selectMedia(
                      imageQuality: 100,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading1 = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();
                      } finally {
                        _model.isDataUploading1 = false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile1 =
                              selectedUploadedFiles.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    _model.result = await actions.returnSizeInBytes(
                      _model.uploadedLocalFile1,
                    );
                    if (_model.result! > 5242880) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'File size must be less than 15 MB',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: Color(0xDA000000),
                        ),
                      );
                      setState(() {
                        _model.isDataUploading1 = false;
                        _model.uploadedLocalFile1 =
                            FFUploadedFile(bytes: Uint8List.fromList([]));
                      });
                    } else {
                      if (_model.uploadedLocalFile1 != null &&
                          (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                              false)) {
                        _model.uploadDateout =
                            await actions.uploadDatatoFireBase(
                          _model.uploadedLocalFile1,
                        );
                        FFAppState().update(() {
                          FFAppState()
                              .addToUploadPhotoPost(_model.uploadDateout!);
                        });
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error!',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            duration: Duration(milliseconds: 3000),
                            backgroundColor: Color(0xDA000000),
                          ),
                        );
                      }
                    }

                    setState(() {});
                  },
                  text: 'Take a photo',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Libre Franklin',
                          color: Color(0xFF007AFF),
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                ),
                Divider(
                  height: 1.0,
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).line,
                ),
                FFButtonWidget(
                  onPressed: () async {
                    final selectedMedia = await selectMedia(
                      imageQuality: 100,
                      mediaSource: MediaSource.photoGallery,
                      multiImage: false,
                    );
                    if (selectedMedia != null &&
                        selectedMedia.every((m) =>
                            validateFileFormat(m.storagePath, context))) {
                      setState(() => _model.isDataUploading2 = true);
                      var selectedUploadedFiles = <FFUploadedFile>[];

                      try {
                        selectedUploadedFiles = selectedMedia
                            .map((m) => FFUploadedFile(
                                  name: m.storagePath.split('/').last,
                                  bytes: m.bytes,
                                  height: m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                            .toList();
                      } finally {
                        _model.isDataUploading2 = false;
                      }
                      if (selectedUploadedFiles.length ==
                          selectedMedia.length) {
                        setState(() {
                          _model.uploadedLocalFile2 =
                              selectedUploadedFiles.first;
                        });
                      } else {
                        setState(() {});
                        return;
                      }
                    }

                    _model.resultGallary = await actions.returnSizeInBytes(
                      _model.uploadedLocalFile2,
                    );
                    if (_model.resultGallary! > 5242880) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'File size must be less than 15 MB',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                          duration: Duration(milliseconds: 3000),
                          backgroundColor: Color(0xDA000000),
                        ),
                      );
                      setState(() {
                        _model.isDataUploading2 = false;
                        _model.uploadedLocalFile2 =
                            FFUploadedFile(bytes: Uint8List.fromList([]));
                      });
                    } else {
                      if (_model.uploadedLocalFile1 != null &&
                          (_model.uploadedLocalFile1.bytes?.isNotEmpty ??
                              false)) {
                        _model.uploadDateoutGallery =
                            await actions.uploadDatatoFireBase(
                          _model.uploadedLocalFile2,
                        );
                        FFAppState().update(() {
                          FFAppState().addToUploadPhotoPost(
                              _model.uploadDateoutGallery!);
                        });
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Error!',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            duration: Duration(milliseconds: 3000),
                            backgroundColor: Color(0xDA000000),
                          ),
                        );
                      }
                    }

                    setState(() {});
                  },
                  text: 'Choose from gallery',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Libre Franklin',
                          color: Color(0xFF007AFF),
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 32.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Cancel',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Colors.white,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Libre Franklin',
                      color: Color(0xFF007AFF),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                elevation: 0.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
