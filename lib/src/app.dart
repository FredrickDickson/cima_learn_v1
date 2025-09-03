import 'package:flutter/material.dart';
import '../config/app_routes.dart';
import '../config/app_theme.dart';

class CimaLearnApp extends StatelessWidget {
  const CimaLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCIMA',
      theme: appTheme,
      debugShowCheckedModeBanner: false, // Added to remove debug banner
      initialRoute: '/',
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}