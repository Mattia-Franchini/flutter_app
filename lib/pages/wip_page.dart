import 'package:flutter/material.dart';

class WipPage extends StatelessWidget {
  const WipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- Illustrazione (icone stilizzate) ---
              Icon(
                Icons.construction_rounded,
                size: 100,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 32),
              // --- Titolo ---
              Text(
                'Work in Progress',
                style: theme.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // --- Sottotitolo/descrizione ---
              Text(
                'Questa sezione è in fase di sviluppo.\nTorna presto per scoprire le novità!',
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
