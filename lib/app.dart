import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/navigation/app_router.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rahul Rawat — AI/ML Engineer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
