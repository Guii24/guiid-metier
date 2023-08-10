// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:guiid_metier/sourcing/sourcing_page/sourcing_page_widget.dart';

import 'package:guiid_metier/post/post_user/post_user_widget.dart';
import 'package:guiid_metier/search/search_page/search_page_widget.dart';

import 'package:guiid_metier/articles/articles_user/articles_user_widget.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      ArticlesUserWidget(),
      PostUserWidget(),
      SourcingPageWidget(),
      SearchPageWidget(),
    ];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _widgetOptions[FFAppState().pageIndex]);
  }
}
