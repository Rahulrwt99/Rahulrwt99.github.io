import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';
import 'package:rahul_portfolio/widgets/common/configured_link_button.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class NavDestination {
  const NavDestination(this.label, this.onTap);

  final String label;
  final VoidCallback onTap;
}

class PortfolioNavbar extends StatelessWidget {
  const PortfolioNavbar({required this.destinations, super.key});

  final List<NavDestination> destinations;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.94),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: ContentContainer(
          child: SizedBox(
            height: 72,
            child: Row(
              children: [
                const _Brand(),
                const Spacer(),
                if (context.isDesktop) ...[
                  for (final destination in destinations)
                    TextButton(
                      onPressed: destination.onTap,
                      child: Text(destination.label),
                    ),
                  const SizedBox(width: 12),
                  const ConfiguredLinkButton(
                    label: 'Resume',
                    url: PortfolioConfig.resumeUrl,
                    icon: Icons.description_outlined,
                    filled: true,
                  ),
                ] else
                  IconButton(
                    tooltip: 'Open navigation',
                    onPressed: () => _showMobileMenu(context),
                    icon: const Icon(Icons.menu_rounded),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surfaceRaised,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final destination in destinations)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(destination.label),
                  trailing: const Icon(Icons.arrow_forward_rounded, size: 18),
                  onTap: () {
                    Navigator.pop(sheetContext);
                    destination.onTap();
                  },
                ),
              const SizedBox(height: 12),
              const ConfiguredLinkButton(
                label: 'Download resume',
                url: PortfolioConfig.resumeUrl,
                icon: Icons.description_outlined,
                filled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${PortfolioConfig.siteName} portfolio home',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.secondary],
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            child: const Text(
              'R',
              style: TextStyle(
                color: AppColors.background,
                fontSize: 19,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 11),
          if (context.screenWidth > 380)
            const Text(
              PortfolioConfig.siteName,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
        ],
      ),
    );
  }
}
