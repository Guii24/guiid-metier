import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/my_profile/popup_wardrobe_delete/popup_wardrobe_delete_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bottom_editor_delete_wear_model.dart';
export 'bottom_editor_delete_wear_model.dart';

class BottomEditorDeleteWearWidget extends StatefulWidget {
  const BottomEditorDeleteWearWidget({
    Key? key,
    this.postDoc,
  }) : super(key: key);

  final PostRecord? postDoc;

  @override
  _BottomEditorDeleteWearWidgetState createState() =>
      _BottomEditorDeleteWearWidgetState();
}

class _BottomEditorDeleteWearWidgetState
    extends State<BottomEditorDeleteWearWidget> {
  late BottomEditorDeleteWearModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomEditorDeleteWearModel());
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 13.0, 16.0, 50.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.0,
              height: 2.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).dark20,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) => Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: PopupWardrobeDeleteWidget(
                                    wearDoc: widget.postDoc,
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          text: 'DELETE',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 15.0,
                                  letterSpacing: 0.5,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);

                          context.pushNamed(
                            'EditWear',
                            queryParameters: {
                              'postDoc': serializeParam(
                                widget.postDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'postDoc': widget.postDoc,
                            },
                          );
                        },
                        text: 'EDIT',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Libre Franklin',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    letterSpacing: 0.5,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
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
    );
  }
}
