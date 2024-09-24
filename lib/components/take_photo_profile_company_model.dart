import '/components/crop_business_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'take_photo_profile_company_widget.dart'
    show TakePhotoProfileCompanyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TakePhotoProfileCompanyModel
    extends FlutterFlowModel<TakePhotoProfileCompanyWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - returnSizeInBytes] action in Button widget.
  int? resultCompany;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - returnSizeInBytes] action in Button widget.
  int? resultgallCompany;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
