import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crop_model.dart';
export 'crop_model.dart';

class CropWidget extends StatefulWidget {
  const CropWidget({
    Key? key,
    required this.img,
  }) : super(key: key);

  final FFUploadedFile? img;

  @override
  _CropWidgetState createState() => _CropWidgetState();
}

class _CropWidgetState extends State<CropWidget> {
  late CropModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CropModel());
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      child: custom_widgets.PhotoCropUI(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        top: 0.0,
        right: 0.0,
        bottom: 0.0,
        left: 0.0,
        imageFile: widget.img!,
        callBackAction: () async {},
      ),
    );
  }
}
