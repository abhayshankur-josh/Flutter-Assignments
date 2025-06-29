import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_model.dart';
import 'package:flutter_assignments/views/details_page.dart';
import 'package:flutter_assignments/views/home_page.dart';

class AppRouter {
  static const homePage = "/home";
  static const detailsPage = "/details";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.detailsPage:
        return MaterialPageRoute(
          builder: (_) => DetailsPage(details: settings.arguments as Profile),
        );
      case AppRouter.homePage:
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}