import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/widgets/common/configured_link_button.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class AboutContactSection extends StatelessWidget {
  const AboutContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final stack = constraints.maxWidth < 800;
          const about = _AboutPanel();
          const contact = _ContactPanel();
          if (stack) {
            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [about, SizedBox(height: 26), contact],
            );
          }
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: about),
              SizedBox(width: 24),
              Expanded(flex: 4, child: contact),
            ],
          );
        },
      ),
    );
  }
}

class _AboutPanel extends StatelessWidget {
  const _AboutPanel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'ABOUT',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            'A builder who connects model capability with product reality.',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 18),
          Text(
            'My work sits at the intersection of AI engineering and product '
            'development. I care about what happens after a model produces '
            'text: retrieval quality, validation, data ownership, API behavior, '
            'client usability, and whether the whole system can actually ship.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class _ContactPanel extends StatelessWidget {
  const _ContactPanel();

  @override
  Widget build(BuildContext context) {
    final emailUrl = PortfolioConfig.isConfigured(PortfolioConfig.email)
        ? 'mailto:${PortfolioConfig.email}'
        : PortfolioConfig.email;
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceRaised,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.waving_hand_rounded,
              color: AppColors.primary, size: 30),
          const SizedBox(height: 20),
          Text('Let’s build something useful.',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 12),
          const Text(
            'I’m open to AI/ML engineering roles and conversations about '
            'production LLM and RAG systems.',
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ConfiguredLinkButton(
                label: 'Email me',
                url: emailUrl,
                icon: Icons.mail_outline_rounded,
                outlineColor: AppColors.secondary,
              ),
              const ConfiguredLinkButton(
                label: 'LinkedIn',
                url: PortfolioConfig.linkedInUrl,
                icon: Icons.person_outline_rounded,
                outlineColor: AppColors.secondary,
              ),
              const ConfiguredLinkButton(
                label: 'GitHub',
                url: PortfolioConfig.githubUrl,
                icon: Icons.code_rounded,
                outlineColor: AppColors.secondary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
