import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SpashScreenWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SpashScreenWidget()
              : OnboardingWidget(),
        ),
        FFRoute(
          name: 'Onboarding',
          path: '/onboarding',
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: 'SpashScreen',
          path: '/spashScreen',
          builder: (context, params) => SpashScreenWidget(),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: 'VerificationSignUp',
          path: '/verificationSignUp',
          builder: (context, params) => VerificationSignUpWidget(
            userName: params.getParam('userName', ParamType.String),
            userPhone: params.getParam('userPhone', ParamType.String),
            profilePhoto: params.getParam('profilePhoto', ParamType.String),
            userType: params.getParam('userType', ParamType.String),
            phoneoriginal: params.getParam('phoneoriginal', ParamType.String),
            phoneName: params.getParam('phoneName', ParamType.String),
            phoneCode: params.getParam('phoneCode', ParamType.String),
            phoneFlag: params.getParam('phoneFlag', ParamType.String),
            phoneDialCode: params.getParam('phoneDialCode', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SignUP',
          path: '/signUP',
          builder: (context, params) => SignUPWidget(),
        ),
        FFRoute(
          name: 'signupBioUser',
          path: '/signupBioUser',
          builder: (context, params) => SignupBioUserWidget(),
        ),
        FFRoute(
          name: 'signupBioCompany',
          path: '/signupBioCompany',
          builder: (context, params) => SignupBioCompanyWidget(),
        ),
        FFRoute(
          name: 'ArticlesUser',
          path: '/articlesUser',
          builder: (context, params) => ArticlesUserWidget(),
        ),
        FFRoute(
          name: 'ArticlePage',
          path: '/articlePage',
          builder: (context, params) => ArticlePageWidget(
            article: params.getParam(
                'article', ParamType.DocumentReference, false, ['articles']),
          ),
        ),
        FFRoute(
          name: 'PostUser',
          path: '/postUser',
          builder: (context, params) => PostUserWidget(),
        ),
        FFRoute(
          name: 'CreatePost',
          path: '/createPost',
          builder: (context, params) => CreatePostWidget(),
        ),
        FFRoute(
          name: 'CreateWear',
          path: '/createWear',
          builder: (context, params) => CreateWearWidget(),
        ),
        FFRoute(
          name: 'SourcingPage',
          path: '/sourcingPage',
          builder: (context, params) => SourcingPageWidget(),
        ),
        FFRoute(
          name: 'JobForm',
          path: '/jobForm',
          asyncParams: {
            'jobDoc': getDoc(['job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => JobFormWidget(
            jobDoc: params.getParam('jobDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'SearchPage',
          path: '/searchPage',
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: 'SearchResultPageOLD',
          path: '/searchResultPageOLD',
          builder: (context, params) => SearchResultPageOLDWidget(
            searchingText: params.getParam('searchingText', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Notifications',
          path: '/notifications',
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: 'MyProfile',
          path: '/myProfile',
          builder: (context, params) => MyProfileWidget(),
        ),
        FFRoute(
          name: 'EditWear',
          path: '/editWear',
          asyncParams: {
            'postDoc': getDoc(['post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => EditWearWidget(
            postDoc: params.getParam('postDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Followers',
          path: '/followers',
          builder: (context, params) => FollowersWidget(),
        ),
        FFRoute(
          name: 'Following',
          path: '/following',
          builder: (context, params) => FollowingWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: 'EditPost',
          path: '/editPost',
          asyncParams: {
            'postRef': getDoc(['post'], PostRecord.fromSnapshot),
          },
          builder: (context, params) => EditPostWidget(
            postRef: params.getParam('postRef', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'PhoneNumberPage',
          path: '/phoneNumberPage',
          builder: (context, params) => PhoneNumberPageWidget(),
        ),
        FFRoute(
          name: 'PhoneNumberEdit',
          path: '/phoneNumberEdit',
          builder: (context, params) => PhoneNumberEditWidget(),
        ),
        FFRoute(
          name: 'BlockedUsers',
          path: '/blockedUsers',
          builder: (context, params) => BlockedUsersWidget(),
        ),
        FFRoute(
          name: 'SupportPage',
          path: '/supportPage',
          builder: (context, params) => SupportPageWidget(),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => AboutUsWidget(),
        ),
        FFRoute(
          name: 'FAQ',
          path: '/faq',
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: 'PrivacyPolicy',
          path: '/privacyPolicy',
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: 'TermsofUse',
          path: '/termsofUse',
          builder: (context, params) => TermsofUseWidget(),
        ),
        FFRoute(
          name: 'OtherProfile',
          path: '/otherProfile',
          builder: (context, params) => OtherProfileWidget(
            userRef: params.getParam(
                'userRef', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'OtherProfileCompany',
          path: '/otherProfileCompany',
          builder: (context, params) => OtherProfileCompanyWidget(
            userRef: params.getParam(
                'userRef', ParamType.DocumentReference, false, ['users']),
          ),
        ),
        FFRoute(
          name: 'PostJobPage',
          path: '/postJobPage',
          builder: (context, params) => PostJobPageWidget(),
        ),
        FFRoute(
          name: 'SourcingMyJobDetails',
          path: '/sourcingMyJobDetails',
          asyncParams: {
            'jobDoc': getDoc(['job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => SourcingMyJobDetailsWidget(
            jobDoc: params.getParam('jobDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'EditPostJobPage',
          path: '/editPostJobPage',
          asyncParams: {
            'jobDoc': getDoc(['job'], JobRecord.fromSnapshot),
          },
          builder: (context, params) => EditPostJobPageWidget(
            jobDoc: params.getParam('jobDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'MyProfileCompany',
          path: '/myProfileCompany',
          builder: (context, params) => MyProfileCompanyWidget(),
        ),
        FFRoute(
          name: 'EditProfileCompany',
          path: '/editProfileCompany',
          builder: (context, params) => EditProfileCompanyWidget(),
        ),
        FFRoute(
          name: 'VerificationLogin',
          path: '/verificationLogin',
          builder: (context, params) => VerificationLoginWidget(
            userPhone: params.getParam('userPhone', ParamType.String),
            countrycode: params.getParam('countrycode', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'MainPage',
          path: '/mainPage',
          builder: (context, params) => MainPageWidget(),
        ),
        FFRoute(
          name: 'PostPage',
          path: '/postPage',
          builder: (context, params) => PostPageWidget(
            postRef: params.getParam(
                'postRef', ParamType.DocumentReference, false, ['post']),
          ),
        ),
        FFRoute(
          name: 'PostPageReposted',
          path: '/postPageReposted',
          builder: (context, params) => PostPageRepostedWidget(
            postRef: params.getParam(
                'postRef', ParamType.DocumentReference, false, ['post']),
          ),
        ),
        FFRoute(
          name: 'FollowersOtherUsers',
          path: '/followersOtherUsers',
          asyncParams: {
            'userDoc': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => FollowersOtherUsersWidget(
            userDoc: params.getParam('userDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'FollowingOtherUsers',
          path: '/followingOtherUsers',
          asyncParams: {
            'userDoc': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => FollowingOtherUsersWidget(
            userDoc: params.getParam('userDoc', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'VerificationEditPhone',
          path: '/verificationEditPhone',
          builder: (context, params) => VerificationEditPhoneWidget(
            phoneOrifinal: params.getParam('phoneOrifinal', ParamType.String),
            phoneNumberEdited:
                params.getParam('phoneNumberEdited', ParamType.String),
            phoneName: params.getParam('phoneName', ParamType.String),
            phoneCode: params.getParam('phoneCode', ParamType.String),
            phoneFlag: params.getParam('phoneFlag', ParamType.String),
            phoneDialCode: params.getParam('phoneDialCode', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'WearPage',
          path: '/wearPage',
          builder: (context, params) => WearPageWidget(
            postDoc: params.getParam(
                'postDoc', ParamType.DocumentReference, false, ['post']),
          ),
        ),
        FFRoute(
          name: 'tesst',
          path: '/tesst',
          builder: (context, params) => TesstWidget(
            searchingText: params.getParam('searchingText', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SearchResultPage',
          path: '/searchResultPage',
          builder: (context, params) => SearchResultPageWidget(
            searchingText: params.getParam('searchingText', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'SearchPageCopy',
          path: '/searchPageCopy',
          builder: (context, params) => SearchPageCopyWidget(),
        ),
        FFRoute(
          name: 'PostUserCopy',
          path: '/postUserCopy',
          builder: (context, params) => PostUserCopyWidget(),
        ),
        FFRoute(
          name: 'SourcingPageCopy',
          path: '/sourcingPageCopy',
          builder: (context, params) => SourcingPageCopyWidget(),
        ),
        FFRoute(
          name: 'MyProfileCopy',
          path: '/myProfileCopy',
          builder: (context, params) => MyProfileCopyWidget(),
        ),
        FFRoute(
          name: 'jobTest',
          path: '/jobTest',
          builder: (context, params) => JobTestWidget(),
        ),
        FFRoute(
          name: 'ArticlesUserCopy',
          path: '/articlesUserCopy',
          builder: (context, params) => ArticlesUserCopyWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
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
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
