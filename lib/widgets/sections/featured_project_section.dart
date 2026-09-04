import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/navigation/app_router.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';
import 'package:rahul_portfolio/data/models/portfolio_project.dart';
import 'package:rahul_portfolio/data/portfolio_content.dart';
import 'package:rahul_portfolio/widgets/common/section_heading.dart';
import 'package:rahul_portfolio/widgets/common/tag_chip.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class FeaturedProjectSection extends StatelessWidget {
  const FeaturedProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final project = PortfolioContent.projects.first;

    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Flagship case study',
            title:
                'Vastu AI: a domain assistant engineered for trustworthy answers.',
            description:
                'The work goes beyond calling a model API. It combines retrieval, '
                'reranking, validation, memory, ownership, backend persistence, '
                'and the client experience into one product system.',
          ),
          const SizedBox(height: 44),
          Container(
            padding: EdgeInsets.all(context.isMobile ? 22 : 38),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.surfaceRaised,
                  AppColors.surface,
                  AppColors.primary.withValues(alpha: 0.05),
                ],
              ),
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(28),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final stack = constraints.maxWidth < 860;
                final details = _ProjectDetails(project: project);
                final pipeline = _PipelinePanel(pipeline: project.pipeline);
                if (stack) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [details, const SizedBox(height: 32), pipeline],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: details),
                    const SizedBox(width: 42),
                    Expanded(flex: 4, child: pipeline),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectDetails extends StatelessWidget {
  const _ProjectDetails({required this.project});

  final PortfolioProject project;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child:
              const Icon(Icons.auto_awesome_rounded, color: AppColors.primary),
        ),
        const SizedBox(height: 24),
        Text(project.title, style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 14),
        Text(project.summary, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final tag in project.tags) TagChip(tag)],
        ),
        const SizedBox(height: 28),
        FilledButton.icon(
          onPressed: () => Navigator.pushNamed(
            context,
            AppRouter.project(project.slug),
          ),
          icon: const Icon(Icons.arrow_forward_rounded, size: 18),
          label: const Text('Read the case study'),
        ),
      ],
    );
  }
}

class _PipelinePanel extends StatelessWidget {
  const _PipelinePanel({required this.pipeline});

  final List<String> pipeline;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.65),
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SYSTEM FLOW',
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 18),
          for (var index = 0; index < pipeline.length; index++) ...[
            _PipelineStep(index: index + 1, label: pipeline[index]),
            if (index < pipeline.length - 1)
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SizedBox(
                  height: 12,
                  child: VerticalDivider(color: AppColors.border, width: 1),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _PipelineStep extends StatelessWidget {
  const _PipelineStep({required this.index, required this.label});

  final int index;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == 8
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.09),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Text(
            '$index',
            style: TextStyle(
              color: index == 8 ? AppColors.background : AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
