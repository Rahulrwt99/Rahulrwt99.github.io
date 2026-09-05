import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rahul_portfolio/app.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/navigation/app_router.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/data/portfolio_content.dart';
import 'package:rahul_portfolio/pages/project_detail_page.dart';
import 'package:rahul_portfolio/widgets/sections/projects_section.dart';

void main() {
  testWidgets('home page presents the core positioning', (tester) async {
    await tester.binding.setSurfaceSize(const Size(1440, 1000));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text(PortfolioConfig.siteName), findsOneWidget);
    expect(find.textContaining('I build AI systems'), findsOneWidget);
    expect(find.text(PortfolioContent.positioning), findsOneWidget);
    expect(PortfolioContent.projects, hasLength(3));
  });

  testWidgets('mobile layout exposes accessible navigation', (tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byTooltip('Open navigation'), findsOneWidget);
    await tester.tap(find.byTooltip('Open navigation'));
    await tester.pumpAndSettle();
    expect(find.text('Capabilities'), findsOneWidget);
  });

  testWidgets('project route builds the matching case study', (tester) async {
    final project = PortfolioContent.projectBySlug('vastu-ai')!;
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: ProjectDetailPage(project: project),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Vastu AI'), findsWidgets);
    expect(
      find.textContaining('production-minded Vastu assistant'),
      findsOneWidget,
    );
  });

  testWidgets('full page remains stable at common responsive widths', (
    tester,
  ) async {
    const sizes = <Size>[
      Size(390, 844),
      Size(768, 1024),
      Size(1440, 1000),
    ];

    for (final size in sizes) {
      await tester.binding.setSurfaceSize(size);
      await tester.pumpWidget(const PortfolioApp());
      await tester.pumpAndSettle();
      final scrollable = tester.state<ScrollableState>(
        find.byType(Scrollable).first,
      );
      scrollable.position.jumpTo(scrollable.position.maxScrollExtent);
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull,
          reason: 'Failed at width ${size.width}');
      expect(find.textContaining('Built with Flutter'), findsOneWidget);
    }
  });

  testWidgets('desktop project cards use equal recruiter-ready dimensions', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1440, 1000));
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: const Scaffold(
          body: SingleChildScrollView(child: ProjectsSection()),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final heights = PortfolioContent.projects
        .map(
          (project) => tester
              .getSize(find.byKey(ValueKey('project-card-${project.slug}')))
              .height,
        )
        .toSet();

    expect(heights, hasLength(1));
  });
}

