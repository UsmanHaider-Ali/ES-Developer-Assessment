import 'package:es_developer_assessment/app/config/app_config.dart';
import 'package:es_developer_assessment/app/config/app_theme.dart';
import 'package:es_developer_assessment/app/routes/app_routes.dart';
import 'package:es_developer_assessment/app/routes/routes_name.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.appName,
      theme: AppTheme.lightTheme,
      initialRoute: RoutesName.splashRoute,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
