import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/theme/app_theme.dart';
import 'package:rahul_portfolio/core/utils/responsive.dart';
import 'package:rahul_portfolio/widgets/layout/content_container.dart';

class ProofSection extends StatelessWidget {
  const ProofSection({super.key});

  static const items = <_ProofItem>[
    _ProofItem('03', 'Android apps\npublished'),
    _ProofItem('End-to-end', 'AI pipeline to\nproduct UI'),
    _ProofItem('Production', 'API, persistence &\nownership thinking'),
    _ProofItem('Cross-stack', 'Python/FastAPI\n+ Flutter'),
  ];

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(24),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth < 620 ? 2 : 4;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(1),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                childAspectRatio: context.isMobile ? 1.2 : 1.45,
              ),
              itemCount: items.length,
              itemBuilder: (_, index) => _ProofTile(item: items[index]),
            );
          },
        ),
      ),
    );
  }
}

class _ProofTile extends StatelessWidget {
  const _ProofTile({required this.item});

  final _ProofItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.isMobile ? 17 : 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.value,
            style: TextStyle(
              color: AppColors.primary,
              fontSize: context.isMobile ? 20 : 25,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            item.label,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: context.isMobile ? 12 : 14,
              height: 1.4,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProofItem {
  const _ProofItem(this.value, this.label);

  final String value;
  final String label;
}
