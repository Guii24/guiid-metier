import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'component_wear_post_model.dart';
export 'component_wear_post_model.dart';

class ComponentWearPostWidget extends StatefulWidget {
  const ComponentWearPostWidget({
    Key? key,
    required this.wearItem,
    required this.index,
  }) : super(key: key);

  final WearItemsStruct? wearItem;
  final int? index;

  @override
  _ComponentWearPostWidgetState createState() =>
      _ComponentWearPostWidgetState();
}

class _ComponentWearPostWidgetState extends State<ComponentWearPostWidget> {
  late ComponentWearPostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentWearPostModel());

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
                    fit: BoxFit.fill,
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
                readOnly: true,
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
                readOnly: true,
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
                      color: FlutterFlowTheme.of(context).dark12,
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
