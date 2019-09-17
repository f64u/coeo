import 'package:flutter/material.dart';
import './screens/HomeScreen.dart';
import './screens/LoginPage.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      // case '/splash':

      // case '/leaderboard':
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("Unknown route: ${settings.name}"),
                  ), // TODO: Find a beter 404
                ));
    }
  }
}
