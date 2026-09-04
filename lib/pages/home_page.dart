import 'package:flutter/material.dart';
import 'package:rahul_portfolio/widgets/navigation/portfolio_navbar.dart';
import 'package:rahul_portfolio/widgets/sections/about_contact_section.dart';
import 'package:rahul_portfolio/widgets/sections/capabilities_section.dart';
import 'package:rahul_portfolio/widgets/sections/featured_project_section.dart';
import 'package:rahul_portfolio/widgets/sections/hero_section.dart';
import 'package:rahul_portfolio/widgets/sections/projects_section.dart';
import 'package:rahul_portfolio/widgets/sections/proof_section.dart';
import 'package:rahul_portfolio/widgets/sections/site_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _workKey = GlobalKey();
  final _capabilitiesKey = GlobalKey();
  final _aboutKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final target = key.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: 0.04,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final destinations = <NavDestination>[
      NavDestination('Work', () => _scrollTo(_workKey)),
      NavDestination('Capabilities', () => _scrollTo(_capabilitiesKey)),
      NavDestination('About', () => _scrollTo(_aboutKey)),
      NavDestination('Contact', () => _scrollTo(_aboutKey)),
    ];

    return Scaffold(
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _NavHeaderDelegate(
                child: PortfolioNavbar(destinations: destinations),
              ),
            ),
            SliverToBoxAdapter(
              child: HeroSection(onViewWork: () => _scrollTo(_workKey)),
            ),
            const SliverToBoxAdapter(child: ProofSection()),
            SliverPadding(
              padding: const EdgeInsets.only(top: 120),
              sliver: SliverToBoxAdapter(
                key: _workKey,
                child: const FeaturedProjectSection(),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 120),
              sliver: SliverToBoxAdapter(child: ProjectsSection()),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 120),
              sliver: SliverToBoxAdapter(
                key: _capabilitiesKey,
                child: const CapabilitiesSection(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 120),
              sliver: SliverToBoxAdapter(
                key: _aboutKey,
                child: const AboutContactSection(),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(top: 100),
              sliver: SliverToBoxAdapter(child: SiteFooter()),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _NavHeaderDelegate({required this.child});

  final Widget child;

  @override
  double get minExtent => 72;

  @override
  double get maxExtent => 72;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant _NavHeaderDelegate oldDelegate) =>
      oldDelegate.child != child;
}
