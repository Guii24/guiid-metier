import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/company_pages/job_type/job_type_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/onboarding_sign_in/country_code/country_code_widget.dart';
import '/sign_u_p/sign_up_location/sign_up_location_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'edit_post_job_page_model.dart';
export 'edit_post_job_page_model.dart';

class EditPostJobPageWidget extends StatefulWidget {
  const EditPostJobPageWidget({
    Key? key,
    required this.jobDoc,
  }) : super(key: key);

  final JobRecord? jobDoc;

  @override
  _EditPostJobPageWidgetState createState() => _EditPostJobPageWidgetState();
}

class _EditPostJobPageWidgetState extends State<EditPostJobPageWidget> {
  late EditPostJobPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditPostJobPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().selectedlocation = valueOrDefault<String>(
          widget.jobDoc?.jobLocation,
          'job location error',
        );
        FFAppState().selectedJobType =
            widget.jobDoc!.jobType.toList().cast<String>();
      });
    });

    _model.textController1 ??=
        TextEditingController(text: widget.jobDoc?.jobTittle);
    _model.textController2 ??=
        TextEditingController(text: widget.jobDoc?.jobDescription);
    _model.textController3 ??=
        TextEditingController(text: widget.jobDoc?.jobSalaryRate);
    _model.textController4 ??=
        TextEditingController(text: FFAppState().selectedlocation);
    _model.textController5 ??=
        TextEditingController(text: widget.jobDoc?.jobContactPhoneNumber);
    _model.textController6 ??=
        TextEditingController(text: widget.jobDoc?.jobContactEmail);
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
          leading: FlutterFlowIconButton(
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
              context.pop();
            },
          ),
          title: Text(
            'EDIT JOB POST',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Libre Franklin',
                  color: FlutterFlowTheme.of(context).dark88,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 22.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController1,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController1',
                              Duration(milliseconds: 10),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelText: 'Job title *',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark38,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark38,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
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
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontWeight: FontWeight.w500,
                                ),
                            minLines: 1,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 16.0, 0.0, 10.0),
                        child: Text(
                          'Description',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController2,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController2',
                              Duration(milliseconds: 10),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Write description',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark38,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).dark12,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).dark12,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.3,
                                ),
                            maxLines: 6,
                            validator: _model.textController2Validator
                                .asValidator(context),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp('^.{1,250}'))
                            ],
                          ),
                        ),
                      ),
                      Text(
                        'Type only 250 characters',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Libre Franklin',
                              color: FlutterFlowTheme.of(context).dark68,
                              fontSize: 14.0,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 24.0, 0.0, 15.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textController3,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.textController3',
                              Duration(milliseconds: 10),
                              () => setState(() {}),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Salary rate *',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
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
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark88,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                            minLines: 1,
                            validator: _model.textController3Validator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 15.0),
                        child: Container(
                          width: double.infinity,
                          height: 42.0,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.textController4,
                                  readOnly: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Location *',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Libre Franklin',
                                          color: FlutterFlowTheme.of(context)
                                              .dark38,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).dark12,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
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
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Libre Franklin',
                                        color:
                                            FlutterFlowTheme.of(context).dark88,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  minLines: 1,
                                  validator: _model.textController4Validator
                                      .asValidator(context),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    barrierColor:
                                        FlutterFlowTheme.of(context).dark38,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SignUpLocationWidget(),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 43.0,
                                  decoration: BoxDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.00, 1.00),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      barrierColor:
                                          FlutterFlowTheme.of(context).dark38,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: JobTypeWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .dark12,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final jobTypes = FFAppState()
                                                .selectedJobType
                                                .toList();
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    jobTypes.length,
                                                    (jobTypesIndex) {
                                                  final jobTypesItem =
                                                      jobTypes[jobTypesIndex];
                                                  return Visibility(
                                                    visible: FFAppState()
                                                                .selectedlocation !=
                                                            null &&
                                                        FFAppState()
                                                                .selectedlocation !=
                                                            '',
                                                    child: Text(
                                                      FFAppState()
                                                          .selectedlocation
                                                          .maybeHandleOverflow(
                                                            maxChars: 38,
                                                            replacement: '…',
                                                          ),
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                    ),
                                                  );
                                                }).divide(SizedBox(width: 4.0)),
                                              ),
                                            );
                                          },
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Contact',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 42.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).dark12,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
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
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Color(0x01000000),
                                        barrierColor:
                                            FlutterFlowTheme.of(context).dark38,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: CountryCodeWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => setState(() {}));
                                    },
                                    child: Text(
                                      'US +1',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
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
                                              FlutterFlowTheme.of(context)
                                                  .dark38,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () =>
                                                  FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CountryCodeWidget(),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: Colors.black,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 100.0,
                                    child: VerticalDivider(
                                      width: 1.0,
                                      thickness: 1.0,
                                      indent: 9.0,
                                      endIndent: 9.0,
                                      color:
                                          FlutterFlowTheme.of(context).accent4,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextFormField(
                                      controller: _model.textController5,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Phone number *',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Libre Franklin',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .dark38,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                              lineHeight: 1.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Libre Franklin',
                                            color: FlutterFlowTheme.of(context)
                                                .dark88,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      minLines: 1,
                                      keyboardType: TextInputType.number,
                                      validator: _model.textController5Validator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask5],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model.textController6,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Email *',
                            labelStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark38,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Libre Franklin',
                                  color: FlutterFlowTheme.of(context).dark38,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
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
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Libre Franklin',
                                    color: FlutterFlowTheme.of(context).dark88,
                                    fontWeight: FontWeight.w500,
                                  ),
                          minLines: 1,
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.textController6Validator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.00, 1.00),
                child: Container(
                  width: double.infinity,
                  height: 68.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15.0,
                        color: Color(0x12000000),
                        offset: Offset(0.0, -6.0),
                      )
                    ],
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.00, -1.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 10.0, 16.0, 10.0),
                      child: FFButtonWidget(
                        onPressed: (_model.textController1.text == null ||
                                    _model.textController1.text == '') ||
                                (_model.textController3.text == null ||
                                    _model.textController3.text == '') ||
                                (_model.textController4.text == null ||
                                    _model.textController4.text == '')
                            ? null
                            : () async {
                                await widget.jobDoc!.reference
                                    .update(createJobRecordData());
                                context.safePop();
                              },
                        text: 'SUBMIT',
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
                          disabledColor:
                              FlutterFlowTheme.of(context).disbledColor,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).primary,
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
    );
  }
}
