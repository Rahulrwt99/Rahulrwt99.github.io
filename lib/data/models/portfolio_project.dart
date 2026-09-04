import 'package:flutter/material.dart';

class PortfolioProject {
  const PortfolioProject({
    required this.slug,
    required this.title,
    required this.category,
    required this.summary,
    required this.icon,
    required this.accent,
    required this.tags,
    required this.highlights,
    required this.challenge,
    required this.approach,
    required this.result,
    required this.storeUrl,
    this.isFeatured = false,
    this.pipeline = const [],
  });

  final String slug;
  final String title;
  final String category;
  final String summary;
  final IconData icon;
  final Color accent;
  final List<String> tags;
  final List<String> highlights;
  final String challenge;
  final String approach;
  final String result;
  final String storeUrl;
  final bool isFeatured;
  final List<String> pipeline;
}
