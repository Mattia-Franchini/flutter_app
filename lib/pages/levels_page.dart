import 'package:flutter/material.dart';
import 'lesson_page.dart';

class LevelsPage extends StatelessWidget {
  final String topic;
  const LevelsPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Solo il primo livello sbloccato
    final int unlockedLevel = 1;
    //final Map<int, int> stars = {1: 0, 2: 0, 3: 0}; // Stelle statiche
    final Map<int, String> levelNames = {
      1: "Base",
      2: "Intermedio",
      3: "Avanzato",
    };

    return Scaffold(
      appBar: AppBar(title: Text(topic)),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: 3,
        itemBuilder: (context, index) {
          final level = index + 1;
          final isUnlocked = level <= unlockedLevel;

          return GestureDetector(
            onTap: isUnlocked && level == 1 // Solo Base porta alle lezioni
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LessonPage(),
                      ),
                    );
                  }
                : null,
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              decoration: BoxDecoration(
                color: isUnlocked
                    ? theme.colorScheme.primaryContainer
                    : Colors.grey[300],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isUnlocked ? theme.colorScheme.primary : Colors.grey,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isUnlocked
                        ? "Livello $level - ${levelNames[level]}"
                        : "🔒 Livello $level - ${levelNames[level]}",
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isUnlocked
                          ? theme.colorScheme.onPrimaryContainer
                          : Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: List.generate(3, (i) {
                      return const Icon(
                        Icons.star_border,
                        color: Colors.grey,
                      );
                    }),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
