import 'package:flutter/material.dart';

// Screens
import '../src/screens/home_page.dart';
import '../src/screens/not_found_page.dart';
import '../src/screens/login_page.dart' as login;
import '../src/screens/signup_page.dart' as signup;
import '../src/screens/enrolled_courses_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());

      case '/login':
        return MaterialPageRoute(builder: (_) => const login.LoginPage());

      case '/signup':
        return MaterialPageRoute(builder: (_) => const signup.SignupPage());

      case '/enrolled_courses':
        return MaterialPageRoute(builder: (_) => const EnrolledCoursesPage());

      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
