import 'package:flutter/material.dart';

class RouteManager {
  static final RouteManager _instance = RouteManager._internal();

  factory RouteManager() {
    return _instance;
  }

  RouteManager._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final Map<String, WidgetBuilder> routes = {};

  void addRoute(String routeName, WidgetBuilder builder) {
    routes[routeName] = builder;
  }

  void removeRoute(String routeName) {
    routes.remove(routeName);
  }

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final WidgetBuilder? builder = routes[settings.name];
    if (builder != null) {
      return MaterialPageRoute<dynamic>(
        builder: builder,
        settings: settings,
      );
    }
    return null;
  }

  void navigateTo(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void goBack(BuildContext context) {
    if(Navigator.canPop(context))
    {
      navigatorKey.currentState?.pop();
    }

  }

  void navigateAndReplace(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigateAndRemoveUntil(String routeName, {dynamic arguments}) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
  }
}
