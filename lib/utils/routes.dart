import 'package:flutter/material.dart';
import 'package:flutter_assignments/models/profile_model.dart';
import 'package:flutter_assignments/views/details_page.dart';
import 'package:flutter_assignments/views/home_page.dart';
import 'package:flutter_assignments/views/login_page.dart';
import 'package:flutter_assignments/views/todo_app.dart';

class AppRouter {
  static const homePage = "/home";
  static const detailsPage = "/details";
  static const loginPage = "/login";
  static const todoPage = "/todo";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.detailsPage:
        return MaterialPageRoute(
          builder: (_) => DetailsPage(details: settings.arguments as Profile),
        );
      case AppRouter.loginPage:
        return MaterialPageRoute(builder: (_) => const LoginForm());
      case AppRouter.todoPage:
        return MaterialPageRoute(builder: (_) => const ToDoApp());
      case AppRouter.homePage:
      default:
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
  }
}