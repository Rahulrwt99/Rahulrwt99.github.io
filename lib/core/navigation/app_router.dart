import 'package:flutter/material.dart';
import 'package:rahul_portfolio/data/portfolio_content.dart';
import 'package:rahul_portfolio/pages/home_page.dart';
import 'package:rahul_portfolio/pages/not_found_page.dart';
import 'package:rahul_portfolio/pages/project_detail_page.dart';

abstract class AppRouter {
  static const home = '/';
  static const projectPrefix = '/projects/';

  static String project(String slug) => '$projectPrefix$slug';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? home);

    if (uri.path == home) {
      return _fade(const HomePage(), settings);
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'projects') {
      final selected = PortfolioContent.projectBySlug(uri.pathSegments.last);
      if (selected != null) {
        return _fade(ProjectDetailPage(project: selected), settings);
      }
    }

    return _fade(const NotFoundPage(), settings);
  }

  static PageRouteBuilder<dynamic> _fade(
    Widget page,
    RouteSettings settings,
  ) {
    return PageRouteBuilder<dynamic>(
      settings: settings,
      pageBuilder: (_, animation, __) => FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: page,
      ),
      transitionDuration: const Duration(milliseconds: 260),
    );
  }
}
