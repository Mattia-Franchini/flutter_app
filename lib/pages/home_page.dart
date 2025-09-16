import 'package:flutter/material.dart';
import 'levels_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final topics = [
      {"title": "Apprendimento supervisionato", "color": Colors.blueAccent},
      {"title": "CNN", "color": Colors.green},
      {"title": "Modelli di regressione", "color": Colors.deepPurple},
      {"title": "Apprendimento non supervisionato", "color": Colors.orange},
      {"title": "Reti neurali ricorrenti (RNN)", "color": Colors.redAccent},
      {"title": "Reinforcement Learning", "color": Colors.teal},
      {"title": "NLP (Natural Language Processing)", "color": Colors.indigo},
      {"title": "Visione artificiale", "color": Colors.pinkAccent},
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Benvenuto!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scegli un argomento',
              style: theme.textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            ...topics.map((topic) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildTopicCard(
                    context: context,
                    title: topic["title"] as String,
                    color: topic["color"] as Color,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildTopicCard({
    required BuildContext context,
    required String title,
    required Color color,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LevelsPage(topic: title),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
