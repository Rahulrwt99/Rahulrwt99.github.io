import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';

class ContentContainer extends StatelessWidget {
  const ContentContainer({
    required this.child,
    super.key,
    this.maxWidth = 1200,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.pageGutter),
          child: child,
        ),
      ),
    );
  }
}
