import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Benvenuto!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
            tooltip: 'Notifiche',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header con messaggio ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Scopri le novità di oggi',
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // --- Card in orizzontale ---
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  _buildPromoCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?fit=crop&w=600&q=80',
                    title: 'Nuove destinazioni',
                    theme: theme,
                  ),
                  const SizedBox(width: 16),
                  _buildPromoCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?fit=crop&w=600&q=80',
                    title: 'Eventi speciali',
                    theme: theme,
                  ),
                  const SizedBox(width: 16),
                  _buildPromoCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?fit=crop&w=600&q=80',
                    title: 'Consigli di viaggio',
                    theme: theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- Sezione “Novità” ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Novità',
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildNewsTile(
              theme: theme,
              title: 'Flutter 4.0 in arrivo',
              subtitle: 'Scopri tutte le nuove funzionalità della prossima versione.',
            ),
            _buildNewsTile(
              theme: theme,
              title: 'Design Moderno',
              subtitle: 'Linee pulite, tipografia elegante e colori dinamici.',
            ),
            _buildNewsTile(
              theme: theme,
              title: 'Eventi della settimana',
              subtitle: 'Incontri e workshop in città: non perderli!',
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCard({
    required String imageUrl,
    required String title,
    required ThemeData theme,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            imageUrl,
            width: 260,
            height: 180,
            fit: BoxFit.cover,
          ),
          Container(
            width: 260,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              title,
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsTile({
    required ThemeData theme,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
