import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/navigation/app_router.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';
import 'package:rahul_portfolio/data/models/portfolio_project.dart';
import 'package:rahul_portfolio/widgets/common/configured_link_button.dart';
import 'package:rahul_portfolio/widgets/common/tag_chip.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({required this.project, super.key});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.background.withValues(alpha: 0.96),
              surfaceTintColor: Colors.transparent,
              toolbarHeight: 72,
              leadingWidth: context.isMobile ? 64 : 96,
              leading: Padding(
                padding: EdgeInsets.only(left: context.isMobile ? 12 : 36),
                child: IconButton(
                  tooltip: 'Back to portfolio',
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacementNamed(context, AppRouter.home);
                    }
                  },
                  icon: const Icon(Icons.arrow_back_rounded),
                ),
              ),
              title: Text(project.title, style: const TextStyle(fontSize: 16)),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: context.isMobile ? 12 : 36),
                  child: ConfiguredLinkButton(
                    label:
                        context.isMobile ? 'Play Store' : 'View on Play Store',
                    url: project.storeUrl,
                    icon: Icons.shop_2_outlined,
                    filled: true,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(child: _ProjectHero(project: project)),
            SliverToBoxAdapter(child: _CaseStudyBody(project: project)),
            const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
          ],
        ),
      ),
    );
  }
}

class _ProjectHero extends StatelessWidget {
  const _ProjectHero({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: context.isMobile ? 64 : 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                color: project.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(project.icon, color: project.accent, size: 30),
            ),
            const SizedBox(height: 26),
            Text(
              project.category.toUpperCase(),
              style: TextStyle(
                color: project.accent,
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              project.title,
              style: context.isMobile
                  ? Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 42)
                  : Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 22),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Text(project.summary,
                  style: Theme.of(context).textTheme.bodyLarge),
            ),
            const SizedBox(height: 28),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tag in project.tags)
                  TagChip(tag, color: project.accent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CaseStudyBody extends StatelessWidget {
  const _CaseStudyBody({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final stack = constraints.maxWidth < 820;
              final story = Column(
                children: [
                  _StoryBlock(
                      index: '01', title: 'Challenge', body: project.challenge),
                  const SizedBox(height: 34),
                  _StoryBlock(
                      index: '02',
                      title: 'Engineering approach',
                      body: project.approach),
                  const SizedBox(height: 34),
                  _StoryBlock(
                      index: '03', title: 'Result', body: project.result),
                ],
              );
              final proof = _HighlightsPanel(project: project);
              if (stack) {
                return Column(
                    children: [story, const SizedBox(height: 34), proof]);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 5, child: story),
                  const SizedBox(width: 60),
                  Expanded(flex: 4, child: proof),
                ],
              );
            },
          ),
          if (project.pipeline.isNotEmpty) ...[
            const SizedBox(height: 96),
            Text('System architecture',
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 14),
            const Text(
              'A staged flow designed to improve relevance before generation and '
              'apply quality checks before an answer reaches the user.',
            ),
            const SizedBox(height: 30),
            _ArchitectureFlow(project: project),
          ],
        ],
      ),
    );
  }
}

class _StoryBlock extends StatelessWidget {
  const _StoryBlock(
      {required this.index, required this.title, required this.body});

  final String index;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index,
          style: const TextStyle(
              color: AppColors.primary, fontWeight: FontWeight.w900),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 12),
              Text(body, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ],
    );
  }
}

class _HighlightsPanel extends StatelessWidget {
  const _HighlightsPanel({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Engineering highlights',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 22),
          for (final highlight in project.highlights) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle_rounded,
                    color: project.accent, size: 19),
                const SizedBox(width: 11),
                Expanded(child: Text(highlight)),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}

class _ArchitectureFlow extends StatelessWidget {
  const _ArchitectureFlow({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var index = 0; index < project.pipeline.length; index++) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: project.accent.withValues(alpha: 0.14),
              border: Border.all(color: project.accent),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              project.pipeline[index],
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
            ),
          ),
          if (index < project.pipeline.length - 1)
            const Icon(Icons.arrow_forward_rounded,
                color: AppColors.textMuted, size: 18),
        ],
      ],
    );
  }
}
