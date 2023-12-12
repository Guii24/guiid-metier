import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'support_companent_model.dart';
export 'support_companent_model.dart';

class SupportCompanentWidget extends StatefulWidget {
  const SupportCompanentWidget({
    Key? key,
    required this.messageItem,
  }) : super(key: key);

  final MessageRecord? messageItem;

  @override
  _SupportCompanentWidgetState createState() => _SupportCompanentWidgetState();
}

class _SupportCompanentWidgetState extends State<SupportCompanentWidget> {
  late SupportCompanentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportCompanentModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.messageItem?.messageAuthor != currentUserReference)
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                    child: Container(
                      width: 34.0,
                      height: 34.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).success,
                        shape: BoxShape.circle,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Icon(
                          FFIcons.kproperty1support2,
                          color: FlutterFlowTheme.of(context).primary,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width * 0.4,
                      minHeight: 58.0,
                      maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x81DFEAE3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(13.0, 9.0, 13.0, 9.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            valueOrDefault<String>(
                              widget.messageItem?.messageText,
                              'text error',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 15.0,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                'jm',
                                widget.messageItem!.messageTime!,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: Color(0xFF71747A),
                                    fontSize: 11.0,
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
        if (widget.messageItem?.messageAuthor == currentUserReference)
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.sizeOf(context).width * 0.4,
                      minHeight: 58.0,
                      maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).line,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(13.0, 9.0, 13.0, 9.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.00, -1.00),
                            child: Text(
                              valueOrDefault<String>(
                                widget.messageItem?.messageText,
                                'text error',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 15.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Text(
                              dateTimeFormat(
                                'jm',
                                widget.messageItem!.messageTime!,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: Color(0xFF71747A),
                                    fontSize: 11.0,
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
      ],
    );
  }
}
