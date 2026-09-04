import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/data/portfolio_content.dart';
import 'package:rahul_portfolio/widgets/common/section_heading.dart';
import 'package:rahul_portfolio/widgets/common/tag_chip.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class CapabilitiesSection extends StatelessWidget {
  const CapabilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Engineering range',
            title: 'AI depth with product delivery built in.',
            description:
                'I work across the layers that turn an AI capability into a '
                'usable product: knowledge, models, services, data, and clients.',
          ),
          const SizedBox(height: 42),
          LayoutBuilder(
            builder: (context, constraints) {
              final stack = constraints.maxWidth < 760;
              final cards = [
                for (final capability in PortfolioContent.capabilities)
                  _CapabilityCard(capability: capability),
              ];
              if (stack) {
                return Column(
                  children: [
                    for (final card in cards) ...[
                      card,
                      if (card != cards.last) const SizedBox(height: 14),
                    ],
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var index = 0; index < cards.length; index++) ...[
                    Expanded(child: cards[index]),
                    if (index < cards.length - 1) const SizedBox(width: 16),
                  ],
                ],
              );
            },
          ),
          const SizedBox(height: 76),
          LayoutBuilder(
            builder: (context, constraints) {
              final stack = constraints.maxWidth < 760;
              final groups = [
                for (final group in PortfolioContent.skillGroups)
                  _SkillGroupCard(group: group),
              ];
              if (stack) {
                return Column(
                  children: [
                    for (final group in groups) ...[
                      group,
                      if (group != groups.last) const SizedBox(height: 16),
                    ],
                  ],
                );
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var index = 0; index < groups.length; index++) ...[
                    Expanded(child: groups[index]),
                    if (index < groups.length - 1) const SizedBox(width: 18),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CapabilityCard extends StatelessWidget {
  const _CapabilityCard({required this.capability});

  final Capability capability;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(capability.icon, color: AppColors.primary, size: 28),
          const SizedBox(height: 20),
          Text(capability.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Text(capability.description),
        ],
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  const _SkillGroupCard({required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(group.title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final skill in group.skills) TagChip(skill)],
        ),
      ],
    );
  }
}
