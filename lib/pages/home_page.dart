import 'package:flutter/material.dart';
import 'levels_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // Mostra il popup dopo 5 secondi
    Future.delayed(const Duration(seconds: 5), () {
      _showReviewDialog();
    });
  }

  void _showReviewDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star_rate_rounded,
                  color: Colors.amber, size: 72),
              const SizedBox(height: 16),
              const Text(
                "Ti piace l'app?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Lascia una recensione per supportarci 🙌",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Grazie comunque! 😊")),
                      );
                    },
                    child: const Text("No"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Grazie per la recensione! ⭐")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                    ),
                    child: const Text("Sì, certo!"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  final topics = [
    {
      "title": "Apprendimento supervisionato",
      "light": [Colors.blue, Colors.blueAccent],
      "dark": [Colors.blue.shade200, Colors.blue.shade400],
      "icon": Icons.school
    },
    {
      "title": "CNN",
      "light": [Colors.green, Colors.lightGreen],
      "dark": [Colors.greenAccent.shade400, Colors.teal],
      "icon": Icons.image
    },
    {
      "title": "Modelli di regressione",
      "light": [Colors.deepPurple, Colors.purpleAccent],
      "dark": [Colors.purple.shade200, Colors.deepPurpleAccent],
      "icon": Icons.show_chart
    },
    {
      "title": "Apprendimento non supervisionato",
      "light": [Colors.orange, Colors.deepOrange],
      "dark": [Colors.orangeAccent, Colors.deepOrangeAccent],
      "icon": Icons.auto_awesome
    },
    {
      "title": "Reti neurali ricorrenti (RNN)",
      "light": [Colors.redAccent, Colors.red],
      "dark": [Colors.pinkAccent, Colors.redAccent],
      "icon": Icons.repeat
    },
    {
      "title": "Reinforcement Learning",
      "light": [Colors.teal, Colors.cyan],
      "dark": [Colors.tealAccent, Colors.cyanAccent],
      "icon": Icons.sports_esports
    },
    {
      "title": "NLP (Natural Language Processing)",
      "light": [Colors.indigo, Colors.blueGrey],
      "dark": [Colors.indigoAccent, Colors.blueGrey.shade400],
      "icon": Icons.chat
    },
    {
      "title": "Visione artificiale",
      "light": [Colors.pinkAccent, Colors.pink],
      "dark": [Colors.pink.shade200, Colors.purpleAccent],
      "icon": Icons.visibility
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        toolbarHeight: 30,
        elevation: 0,
        title: Row(
          children: const [
            Text(
              'Benvenuto!',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 8),
            Text("👋", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scegli un argomento',
              style: theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            /// 🔹 Griglia di card animate
            Expanded(
              child: GridView.builder(
                itemCount: topics.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.1,
                ),
                itemBuilder: (context, index) {
                  final topic = topics[index];
                  return _AnimatedTopicCard(
                    title: topic["title"] as String,
                    colors: isDark
                        ? topic["dark"] as List<Color>
                        : topic["light"] as List<Color>,
                    icon: topic["icon"] as IconData,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Card con animazione + gradienti adattivi
class _AnimatedTopicCard extends StatefulWidget {
  final String title;
  final List<Color> colors;
  final IconData icon;

  const _AnimatedTopicCard({
    required this.title,
    required this.colors,
    required this.icon,
  });

  @override
  State<_AnimatedTopicCard> createState() => _AnimatedTopicCardState();
}

class _AnimatedTopicCardState extends State<_AnimatedTopicCard> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LevelsPage(topic: widget.title),
          ),
        );
      },
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: widget.colors.last.withOpacity(0.35),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(widget.icon, color: Colors.white, size: 40),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: theme.textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
