import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/config/portfolio_config.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/data/models/portfolio_project.dart';

abstract class PortfolioContent {
  static const positioning =
      'AI/ML Engineer | LLM & RAG Systems | Python/FastAPI | Flutter';

  static const heroSummary =
      'I design, build, and ship AI-powered products—from retrieval and '
      'grounding pipelines to backend APIs and polished mobile experiences.';

  static const projects = <PortfolioProject>[
    PortfolioProject(
      slug: 'vastu-ai',
      title: 'Vastu AI',
      category: 'Flagship · Domain-specific AI assistant',
      summary: 'A production-minded Vastu assistant that combines a Qwen 1.5B '
          'language model with multi-stage retrieval, reranking, validation, '
          'grounding, and conversational memory.',
      icon: Icons.auto_awesome_rounded,
      accent: AppColors.primary,
      tags: <String>[
        'Qwen 1.5B',
        'RAG',
        'FAISS',
        'CrossEncoder',
        'FastAPI',
        'Flutter',
      ],
      highlights: <String>[
        'Multi-stage retrieval with embeddings, FAISS, and CrossEncoder reranking',
        'Grounding and NLI checks designed to reduce unsupported answers',
        'Direction validation and domain-specific response controls',
        'Chat memory with client ownership boundaries',
        'FastAPI and SQLite backend connected to a Flutter client',
      ],
      challenge:
          'A domain assistant needs more than fluent generation. It must find '
          'relevant knowledge, preserve conversational context, validate '
          'domain constraints, and keep answers tied to retrieved evidence.',
      approach:
          'The system uses a staged RAG pipeline: ingest and chunk knowledge, '
          'create embeddings, retrieve candidates through FAISS, rerank them '
          'with a CrossEncoder, then generate with Qwen 1.5B. Grounding, NLI, '
          'and direction validation add domain-aware quality gates.',
      result:
          'An end-to-end AI product architecture spanning knowledge processing, '
          'model orchestration, API design, persistent chat context, ownership '
          'boundaries, and a production Flutter experience.',
      storeUrl: PortfolioConfig.vastuAiPlayStoreUrl,
      isFeatured: true,
      pipeline: <String>[
        'Knowledge ingestion',
        'Chunking',
        'Embeddings',
        'FAISS retrieval',
        'CrossEncoder reranking',
        'Qwen generation',
        'Grounding + NLI',
        'Validated answer',
      ],
    ),
    PortfolioProject(
      slug: 'astro-panchang-calendar',
      title: 'Astro Panchang Calendar',
      category: 'Published Android application',
      summary:
          'A shipped mobile product that demonstrates ownership of the full '
          'application lifecycle—from product implementation to Play Store release.',
      icon: Icons.calendar_month_rounded,
      accent: AppColors.secondary,
      tags: <String>['Flutter', 'Android', 'Product delivery'],
      highlights: <String>[
        'Published on Google Play',
        'Built as a user-facing mobile product',
        'Evidence of end-to-end shipping capability',
      ],
      challenge:
          'Turn a focused calendar product concept into a dependable Android '
          'application ready for real users.',
      approach:
          'Use Flutter to create the product experience and carry it through '
          'the delivery workflow required for a public Play Store release.',
      result:
          'A published Android application that adds concrete product-delivery '
          'proof alongside the AI engineering portfolio.',
      storeUrl: PortfolioConfig.astroPanchangPlayStoreUrl,
    ),
    PortfolioProject(
      slug: 'secure-offline-pdf-reader',
      title: 'Secure Offline PDF Reader',
      category: 'Published Android application',
      summary: 'An offline-focused PDF reader built and released as a complete '
          'Android product, reinforcing practical mobile engineering experience.',
      icon: Icons.picture_as_pdf_rounded,
      accent: Color(0xFFFFB77D),
      tags: <String>['Flutter', 'Android', 'Offline-first'],
      highlights: <String>[
        'Published on Google Play',
        'Offline-focused product positioning',
        'Built through release, not only prototype stage',
      ],
      challenge:
          'Deliver a focused document-reading experience with an offline-first '
          'product direction.',
      approach:
          'Build the application in Flutter with the product scope centered on '
          'local use, then complete the Android publishing lifecycle.',
      result:
          'A third shipped Android application demonstrating consistency in '
          'taking product ideas through implementation and release.',
      storeUrl: PortfolioConfig.pdfReaderPlayStoreUrl,
    ),
  ];

  static const capabilities = <Capability>[
    Capability(
      icon: Icons.hub_rounded,
      title: 'LLM & RAG systems',
      description:
          'Retrieval pipelines, embeddings, vector search, reranking, prompt '
          'context, grounding, and quality controls.',
    ),
    Capability(
      icon: Icons.api_rounded,
      title: 'AI backend engineering',
      description:
          'Python services, FastAPI endpoints, persistence, client ownership, '
          'and model orchestration built as a cohesive system.',
    ),
    Capability(
      icon: Icons.phone_android_rounded,
      title: 'Product delivery',
      description:
          'Adaptive Flutter experiences connected to real backends and carried '
          'through to public Android releases.',
    ),
  ];

  static const skillGroups = <SkillGroup>[
    SkillGroup('AI engineering', <String>[
      'Large Language Models',
      'Retrieval-Augmented Generation',
      'Embeddings',
      'FAISS',
      'CrossEncoder reranking',
      'NLI & grounding',
      'Chat memory',
    ]),
    SkillGroup('Backend & data', <String>[
      'Python',
      'FastAPI',
      'REST APIs',
      'SQLite',
      'Data validation',
      'System design',
    ]),
    SkillGroup('Product engineering', <String>[
      'Flutter',
      'Dart',
      'Responsive UI',
      'Android',
      'API integration',
      'Play Store delivery',
    ]),
  ];

  static PortfolioProject? projectBySlug(String slug) {
    for (final project in projects) {
      if (project.slug == slug) return project;
    }
    return null;
  }
}

class Capability {
  const Capability({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}

class SkillGroup {
  const SkillGroup(this.title, this.skills);

  final String title;
  final List<String> skills;
}
