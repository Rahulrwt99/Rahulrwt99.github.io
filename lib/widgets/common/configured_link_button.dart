import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/utils/url_opener.dart';

class ConfiguredLinkButton extends StatelessWidget {
  const ConfiguredLinkButton({
    required this.label,
    required this.url,
    super.key,
    this.icon = Icons.arrow_outward_rounded,
    this.filled = false,
    this.outlineColor,
  });

  final String label;
  final String url;
  final IconData icon;
  final bool filled;
  final Color? outlineColor;

  @override
  Widget build(BuildContext context) {
    final isConfigured = PortfolioConfig.isConfigured(url);
    final onPressed = isConfigured ? () => openExternalUrl(url) : null;
    final button = filled
        ? FilledButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, size: 18),
            label: Text(label),
          )
        : OutlinedButton.icon(
            onPressed: onPressed,
            style: outlineColor == null
                ? null
                : OutlinedButton.styleFrom(
                    side: BorderSide(color: outlineColor!),
                  ),
            icon: Icon(icon, size: 18),
            label: Text(label),
          );

    return Tooltip(
      message: isConfigured ? 'Open $label' : 'Add this URL in PortfolioConfig',
      child: button,
    );
  }
}
