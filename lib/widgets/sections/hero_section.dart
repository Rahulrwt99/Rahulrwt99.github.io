import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';
import 'package:rahul_portfolio/data/portfolio_content.dart';
import 'package:rahul_portfolio/widgets/common/configured_link_button.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({required this.onViewWork, super.key});

  final VoidCallback onViewWork;

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.only(
          top: context.isMobile ? 72 : 112,
          bottom: context.isMobile ? 72 : 112,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: context.isMobile ? -150 : -60,
              top: -120,
              child: IgnorePointer(
                child: Container(
                  width: 380,
                  height: 380,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        AppColors.secondary.withValues(alpha: 0.14),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _AvailabilityPill(),
                  const SizedBox(height: 28),
                  Semantics(
                    header: true,
                    child: Text(
                      'I build AI systems\nthat become real products.',
                      style: context.isMobile
                          ? Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(fontSize: 43, letterSpacing: -1.5)
                          : Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 720),
                    child: Text(
                      PortfolioContent.heroSummary,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: context.isMobile ? 17 : 20,
                          ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    PortfolioContent.positioning,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 34),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      FilledButton.icon(
                        onPressed: onViewWork,
                        icon:
                            const Icon(Icons.arrow_downward_rounded, size: 18),
                        label: const Text('Explore my work'),
                      ),
                      const ConfiguredLinkButton(
                        label: 'Download resume',
                        url: PortfolioConfig.resumeUrl,
                        icon: Icons.description_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AvailabilityPill extends StatelessWidget {
  const _AvailabilityPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.border),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 9, color: AppColors.success),
          SizedBox(width: 9),
          Flexible(
            child: Text(
              'Open to AI/ML engineering opportunities',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
