import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_location_model.dart';
export 'sign_up_location_model.dart';

class SignUpLocationWidget extends StatefulWidget {
  const SignUpLocationWidget({Key? key}) : super(key: key);

  @override
  _SignUpLocationWidgetState createState() => _SignUpLocationWidgetState();
}

class _SignUpLocationWidgetState extends State<SignUpLocationWidget> {
  late SignUpLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpLocationModel());

    _model.textController ??= TextEditingController();
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.85,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 13.0, 0.0, 0.0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      width: 41.0,
                      height: 3.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).dark20,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
                child: Text(
                  'Living in',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark88,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              TextFormField(
                controller: _model.textController,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 10),
                  () async {
                    await actions.updatePage(
                      context,
                    );
                  },
                ),
                onFieldSubmitted: (_) async {
                  await actions.updatePage(
                    context,
                  );
                },
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Search',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark68,
                        fontSize: 15.0,
                      ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).line,
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
                  contentPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 20.0,
                  ),
                  suffixIcon: _model.textController!.text.isNotEmpty
                      ? InkWell(
                          onTap: () async {
                            _model.textController?.clear();
                            await actions.updatePage(
                              context,
                            );
                            setState(() {});
                          },
                          child: Icon(
                            Icons.clear,
                            size: 24.0,
                          ),
                        )
                      : null,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator: _model.textControllerValidator.asValidator(context),
              ),
              FutureBuilder<ApiCallResponse>(
                future: GoogleAutoCompleteCall.call(
                  input: _model.textController.text,
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
                  final containerGoogleAutoCompleteResponse = snapshot.data!;
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if ((_model.textController.text != null &&
                                _model.textController.text != '') &&
                            (GoogleAutoCompleteCall.status(
                                  containerGoogleAutoCompleteResponse.jsonBody,
                                ).toString() ==
                                'OK'))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 21.0, 16.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final locations = GoogleAutoCompleteCall.terms(
                                      containerGoogleAutoCompleteResponse
                                          .jsonBody,
                                    )
                                        ?.where((e) =>
                                            getJsonField(
                                              containerGoogleAutoCompleteResponse
                                                  .jsonBody,
                                              r'''$.predictions[0].terms[0].value''',
                                            ) !=
                                            null)
                                        .toList()
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: locations.length,
                                  itemBuilder: (context, locationsIndex) {
                                    final locationsItem =
                                        locations[locationsIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          FFAppState().selectedlocation = () {
                                            if (getJsonField(
                                                  locationsItem,
                                                  r'''$[2].value''',
                                                ) ==
                                                null) {
                                              return '${getJsonField(
                                                locationsItem,
                                                r'''$[0].value''',
                                              ).toString()}, ${getJsonField(
                                                locationsItem,
                                                r'''$[1].value''',
                                              ).toString()}';
                                            } else if (getJsonField(
                                                  locationsItem,
                                                  r'''$[1].value''',
                                                ) ==
                                                null) {
                                              return getJsonField(
                                                locationsItem,
                                                r'''$[0].value''',
                                              ).toString();
                                            } else {
                                              return '${getJsonField(
                                                locationsItem,
                                                r'''$[0].value''',
                                              ).toString()}, ${getJsonField(
                                                locationsItem,
                                                r'''$[2].value''',
                                              ).toString()}';
                                            }
                                          }();
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.search_sharp,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark88,
                                              size: 22.0,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 12.0),
                                              child: Text(
                                                () {
                                                  if (getJsonField(
                                                        locationsItem,
                                                        r'''$[2].value''',
                                                      ) ==
                                                      null) {
                                                    return '${getJsonField(
                                                      locationsItem,
                                                      r'''$[0].value''',
                                                    ).toString()}, ${getJsonField(
                                                      locationsItem,
                                                      r'''$[1].value''',
                                                    ).toString()}';
                                                  } else if (getJsonField(
                                                        locationsItem,
                                                        r'''$[1].value''',
                                                      ) ==
                                                      null) {
                                                    return getJsonField(
                                                      locationsItem,
                                                      r'''$[0].value''',
                                                    ).toString();
                                                  } else {
                                                    return '${getJsonField(
                                                      locationsItem,
                                                      r'''$[0].value''',
                                                    ).toString()}, ${getJsonField(
                                                      locationsItem,
                                                      r'''$[2].value''',
                                                    ).toString()}';
                                                  }
                                                }()
                                                    .maybeHandleOverflow(
                                                  maxChars: 38,
                                                  replacement: '…',
                                                ),
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
