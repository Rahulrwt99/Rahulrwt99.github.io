import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 28),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runAlignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 12,
            children: [
              Text(
                '© Rahul Rawat · AI/ML Engineer',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
              Text(
                'Built with Flutter · ${PortfolioConfig.location}',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
