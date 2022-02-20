import 'package:blog_app/core/components/card/not_found_navigation_widget.dart';
import 'package:blog_app/view/auth/login/view/login_view.dart';
import 'package:blog_app/view/auth/register/view/register_view.dart';
import 'package:blog_app/view/home/bottom_navigation_bar/view/bottom_navigation_bar_view.dart';
import 'package:flutter/material.dart';
import '../../../view/home/blog_detail/view/blog_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.defaultPage:
        return normalNavigate(const LoginView());
      case NavigationConstants.blogDetail:
        return normalNavigate(BlogDetailView(model: args.arguments));
      case NavigationConstants.register:
        return normalNavigate(const RegisterView());
      case NavigationConstants.login:
        return normalNavigate(const LoginView());
      case NavigationConstants.home:
        return normalNavigate(const BottomNavigationBarView());
      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
