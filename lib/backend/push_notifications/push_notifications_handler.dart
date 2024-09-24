import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/Spash.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Onboarding': ParameterData.none(),
  'SpashScreen': ParameterData.none(),
  'Welcome': ParameterData.none(),
  'VerificationSignUp': (data) async => ParameterData(
        allParams: {
          'userName': getParameter<String>(data, 'userName'),
          'userPhone': getParameter<String>(data, 'userPhone'),
          'profilePhoto': getParameter<String>(data, 'profilePhoto'),
          'userType': getParameter<String>(data, 'userType'),
          'phoneoriginal': getParameter<String>(data, 'phoneoriginal'),
          'phoneName': getParameter<String>(data, 'phoneName'),
          'phoneCode': getParameter<String>(data, 'phoneCode'),
          'phoneFlag': getParameter<String>(data, 'phoneFlag'),
          'phoneDialCode': getParameter<String>(data, 'phoneDialCode'),
        },
      ),
  'SignUP': ParameterData.none(),
  'signupBioUser': ParameterData.none(),
  'signupBioCompany': ParameterData.none(),
  'ArticlesUser': ParameterData.none(),
  'ArticlePage': (data) async => ParameterData(
        allParams: {
          'article': getParameter<DocumentReference>(data, 'article'),
        },
      ),
  'PostUser': ParameterData.none(),
  'CreatePost': ParameterData.none(),
  'CreateWear': ParameterData.none(),
  'SourcingPage': ParameterData.none(),
  'JobForm': (data) async => ParameterData(
        allParams: {
          'jobDoc': await getDocumentParameter<JobRecord>(
              data, 'jobDoc', JobRecord.fromSnapshot),
        },
      ),
  'SearchPage': ParameterData.none(),
  'SearchResultPageOLD': (data) async => ParameterData(
        allParams: {
          'searchingText': getParameter<String>(data, 'searchingText'),
        },
      ),
  'Notifications': ParameterData.none(),
  'MyProfile': ParameterData.none(),
  'EditWear': (data) async => ParameterData(
        allParams: {
          'postDoc': await getDocumentParameter<PostRecord>(
              data, 'postDoc', PostRecord.fromSnapshot),
        },
      ),
  'Followers': ParameterData.none(),
  'Following': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'EditPost': (data) async => ParameterData(
        allParams: {
          'postRef': await getDocumentParameter<PostRecord>(
              data, 'postRef', PostRecord.fromSnapshot),
        },
      ),
  'Settings': ParameterData.none(),
  'PhoneNumberPage': ParameterData.none(),
  'PhoneNumberEdit': ParameterData.none(),
  'BlockedUsers': ParameterData.none(),
  'SupportPage': ParameterData.none(),
  'AboutUs': ParameterData.none(),
  'FAQ': ParameterData.none(),
  'PrivacyPolicy': ParameterData.none(),
  'TermsofUse': ParameterData.none(),
  'OtherProfile': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'OtherProfileCompany': (data) async => ParameterData(
        allParams: {
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
        },
      ),
  'PostJobPage': ParameterData.none(),
  'SourcingMyJobDetails': (data) async => ParameterData(
        allParams: {
          'jobDoc': await getDocumentParameter<JobRecord>(
              data, 'jobDoc', JobRecord.fromSnapshot),
        },
      ),
  'EditPostJobPage': (data) async => ParameterData(
        allParams: {
          'jobDoc': await getDocumentParameter<JobRecord>(
              data, 'jobDoc', JobRecord.fromSnapshot),
        },
      ),
  'MyProfileCompany': ParameterData.none(),
  'EditProfileCompany': ParameterData.none(),
  'VerificationLogin': (data) async => ParameterData(
        allParams: {
          'userPhone': getParameter<String>(data, 'userPhone'),
        },
      ),
  'MainPage': ParameterData.none(),
  'PostPage': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'PostPageReposted': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'FollowersOtherUsers': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<UsersRecord>(
              data, 'userDoc', UsersRecord.fromSnapshot),
        },
      ),
  'FollowingOtherUsers': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<UsersRecord>(
              data, 'userDoc', UsersRecord.fromSnapshot),
        },
      ),
  'VerificationEditPhone': (data) async => ParameterData(
        allParams: {
          'phoneOrifinal': getParameter<String>(data, 'phoneOrifinal'),
          'phoneNumberEdited': getParameter<String>(data, 'phoneNumberEdited'),
          'phoneName': getParameter<String>(data, 'phoneName'),
          'phoneCode': getParameter<String>(data, 'phoneCode'),
          'phoneFlag': getParameter<String>(data, 'phoneFlag'),
          'phoneDialCode': getParameter<String>(data, 'phoneDialCode'),
        },
      ),
  'WearPage': (data) async => ParameterData(
        allParams: {
          'postDoc': getParameter<DocumentReference>(data, 'postDoc'),
        },
      ),
  'tesst': (data) async => ParameterData(
        allParams: {
          'searchingText': getParameter<String>(data, 'searchingText'),
        },
      ),
  'SearchResultPage': (data) async => ParameterData(
        allParams: {
          'searchingText': getParameter<String>(data, 'searchingText'),
        },
      ),
  'SearchPageCopy': ParameterData.none(),
  'PostUserCopy': ParameterData.none(),
  'SourcingPageCopy': ParameterData.none(),
  'MyProfileCopy': ParameterData.none(),
  'jobTest': ParameterData.none(),
  'ArticlesUserCopy': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
