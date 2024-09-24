import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crop_wear_photo_model.dart';
export 'crop_wear_photo_model.dart';

class CropWearPhotoWidget extends StatefulWidget {
  const CropWearPhotoWidget({
    super.key,
    required this.img,
  });

  final FFUploadedFile? img;

  @override
  State<CropWearPhotoWidget> createState() => _CropWearPhotoWidgetState();
}

class _CropWearPhotoWidgetState extends State<CropWearPhotoWidget> {
  late CropWearPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CropWearPhotoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: custom_widgets.WearPhotoCropUI(
        width: double.infinity,
        height: double.infinity,
        top: 0.0,
        right: 0.0,
        bottom: 0.0,
        left: 0.0,
        imageFile: widget!.img!,
        callBackAction: () async {},
      ),
    );
  }
}
