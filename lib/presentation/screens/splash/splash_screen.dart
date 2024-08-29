import 'package:es_developer_assessment/app/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) Navigator.pushNamedAndRemoveUntil(context, RoutesName.homeRoute, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(elevation: 0),
        body: Center(child: Text('ES Developer Assessment', style: Theme.of(context).textTheme.titleLarge)));
  }
}
