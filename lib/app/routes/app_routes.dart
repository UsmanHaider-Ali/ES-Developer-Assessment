import 'package:es_developer_assessment/app/routes/routes_name.dart';
import 'package:es_developer_assessment/domain/models/movie/movie_model.dart';
import 'package:es_developer_assessment/presentation/screens/home/home_screen.dart';
import 'package:es_developer_assessment/presentation/screens/movie_detail/movie_detail_screen.dart';
import 'package:es_developer_assessment/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final movieModel = routeSettings.arguments as MovieModel?;

    switch (routeSettings.name) {
      case RoutesName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RoutesName.movieDetailRoute:
        return MaterialPageRoute(
          builder: (_) => MovieDetailScreen(movieModel: movieModel!),
        );
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${routeSettings.name}.'))));
    }
  }
}
