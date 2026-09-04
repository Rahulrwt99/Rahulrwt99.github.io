import 'package:flutter/material.dart';
import 'package:rahul_portfolio/core/navigation/app_router.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SelectionArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.explore_off_rounded, size: 52),
                const SizedBox(height: 18),
                Text('Page not found',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 12),
                const Text('The page you requested does not exist.'),
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, AppRouter.home),
                  child: const Text('Return home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
