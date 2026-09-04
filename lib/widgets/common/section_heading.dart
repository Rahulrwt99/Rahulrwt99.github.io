import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    required this.eyebrow,
    required this.title,
    required this.description,
    super.key,
    this.maxWidth = 720,
  });

  final String eyebrow;
  final String title;
  final String description;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            title,
            style: context.isMobile
                ? Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontSize: 30)
                : Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          Text(description, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
