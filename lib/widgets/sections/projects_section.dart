import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/navigation/app_router.dart';
import 'package:rahul_portfolio/data/models/portfolio_project.dart';
import 'package:rahul_portfolio/data/portfolio_content.dart';
import 'package:rahul_portfolio/widgets/common/section_heading.dart';
import 'package:rahul_portfolio/widgets/common/tag_chip.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Published products',
            title: 'Three Android apps. Built through release.',
            description:
                'Shipping changes the engineering conversation. These products '
                'show implementation ownership beyond experiments and demos.',
          ),
          const SizedBox(height: 42),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 980
                  ? 3
                  : constraints.maxWidth >= 600
                      ? 2
                      : 1;
              if (columns == 1) {
                return Column(
                  children: [
                    for (var index = 0;
                        index < PortfolioContent.projects.length;
                        index++) ...[
                      _ProjectCard(
                        project: PortfolioContent.projects[index],
                        fillHeight: false,
                      ),
                      if (index < PortfolioContent.projects.length - 1)
                        const SizedBox(height: 18),
                    ],
                  ],
                );
              }

              final cardHeight = columns == 3
                  ? 480.0
                  : constraints.maxWidth >= 840
                      ? 500.0
                      : 560.0;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  mainAxisExtent: cardHeight,
                ),
                itemCount: PortfolioContent.projects.length,
                itemBuilder: (context, index) => _ProjectCard(
                  project: PortfolioContent.projects[index],
                  fillHeight: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project, required this.fillHeight});

  final PortfolioProject project;
  final bool fillHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey('project-card-${project.slug}'),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, AppRouter.project(project.slug)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: project.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(project.icon, color: project.accent),
                  ),
                  Icon(Icons.arrow_outward_rounded, color: project.accent),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                project.category.toUpperCase(),
                style: TextStyle(
                  color: project.accent,
                  fontSize: 10,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Text(project.title,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Text(
                project.summary,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              if (fillHeight) const Spacer() else const SizedBox(height: 22),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  for (final tag in project.tags.take(3))
                    TagChip(tag, color: project.accent),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
