import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';

class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key, this.color = AppColors.primary});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        border: Border.all(color: color.withValues(alpha: 0.28)),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
