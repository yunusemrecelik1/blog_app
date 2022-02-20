import 'package:flutter/material.dart';
import 'INavigationService.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  get removeAllOldRoutes => (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }

  @override
  Future<void> navigateToPage({required String path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }
}
