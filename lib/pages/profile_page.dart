import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Profilo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // --- Foto profilo ---
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?fit=crop&w=400&q=80',
              ),
            ),
            const SizedBox(height: 16),
            // --- Nome e bio ---
            Text(
              'Mario Rossi',
              style: theme.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'App Developer • Flutter Enthusiast',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // --- Statistiche ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat('Progetti', '12', theme),
                  _buildStat('Follower', '340', theme),
                  _buildStat('Seguiti', '180', theme),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // --- Pulsanti ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('Modifica Profilo'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton.filledTonal(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                    tooltip: 'Impostazioni',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // --- Lista contenuti fittizi ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'I miei post',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildPostCard(
              title: 'Nuovo progetto Flutter',
              subtitle: 'Un’app moderna con Material 3 e animazioni fluide.',
              theme: theme,
            ),
            _buildPostCard(
              title: 'Consigli per UI Design',
              subtitle: 'Colori, tipografia e layout per app accattivanti.',
              theme: theme,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value, ThemeData theme) {
    return Column(
      children: [
        Text(
          value,
          style: theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodyMedium!.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required String title,
    required String subtitle,
    required ThemeData theme,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            title,
            style: theme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: theme.textTheme.bodyMedium,
          ),
          trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
          onTap: () {},
        ),
      ),
    );
  }
}
