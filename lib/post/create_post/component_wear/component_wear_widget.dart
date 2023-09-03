import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_wear_model.dart';
export 'component_wear_model.dart';

class ComponentWearWidget extends StatefulWidget {
  const ComponentWearWidget({
    Key? key,
    required this.wearItem,
    required this.index,
  }) : super(key: key);

  final WearItemsStruct? wearItem;
  final int? index;

  @override
  _ComponentWearWidgetState createState() => _ComponentWearWidgetState();
}

class _ComponentWearWidgetState extends State<ComponentWearWidget> {
  late ComponentWearModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentWearModel());

    _model.textController1 ??=
        TextEditingController(text: widget.wearItem?.wearText);
    _model.textController2 ??=
        TextEditingController(text: widget.wearItem?.wearLink);
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
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.345,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.network(
                    widget.wearItem!.wearImage,
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.345,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 19.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _model.updatePage(() {
                          FFAppState()
                              .removeAtIndexFromWearItems(widget.index!);
                        });
                        await actions.updatePage(
                          context,
                        );
                      },
                      child: Icon(
                        FFIcons.kproperty1trash,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 24.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              child: TextFormField(
                controller: _model.textController1,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController1',
                  Duration(milliseconds: 2000),
                  () async {
                    setState(() {
                      FFAppState().updateWearItemsAtIndex(
                        widget.index!,
                        (e) => e..wearText = _model.textController1.text,
                      );
                    });
                  },
                ),
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark38,
                        fontSize: 15.0,
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
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Libre Franklin',
                      color: FlutterFlowTheme.of(context).dark68,
                      fontSize: 15.0,
                    ),
                maxLines: null,
                validator: _model.textController1Validator.asValidator(context),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('^.{1,250}'))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              child: TextFormField(
                controller: _model.textController2,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController2',
                  Duration(milliseconds: 2000),
                  () async {
                    setState(() {
                      FFAppState().updateWearItemsAtIndex(
                        widget.index!,
                        (e) => e..wearLink = _model.textController2.text,
                      );
                    });
                  },
                ),
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Product link ',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                        fontFamily: 'Libre Franklin',
                        color: FlutterFlowTheme.of(context).dark38,
                        fontSize: 15.0,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).dark12,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).dark88,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  suffixIcon: Icon(
                    FFIcons.kproperty1link,
                    color: FlutterFlowTheme.of(context).dark88,
                    size: 24.0,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Libre Franklin',
                      color: FlutterFlowTheme.of(context).dark88,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                minLines: 1,
                keyboardType: TextInputType.url,
                validator: _model.textController2Validator.asValidator(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
