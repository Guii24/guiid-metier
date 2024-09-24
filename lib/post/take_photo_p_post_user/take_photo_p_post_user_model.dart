import '/components/crop_post_photo_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import 'take_photo_p_post_user_widget.dart' show TakePhotoPPostUserWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TakePhotoPPostUserModel
    extends FlutterFlowModel<TakePhotoPPostUserWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - returnSizeInBytes] action in Button widget.
  int? result;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Custom Action - returnSizeInBytes] action in Button widget.
  int? resultGallary;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
