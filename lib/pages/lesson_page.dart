import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final PageController _controller = PageController();
  int currentPage = 0;

  // Slide livello base Apprendimento Supervisionato
  final List<String> slides = [
    "Lezione 1: Introduzione\n\nL'apprendimento supervisionato è un tipo di Machine Learning in cui il modello viene addestrato con dati etichettati.",
    "Lezione 2: Dati etichettati\n\nOgni esempio del dataset contiene input (caratteristiche) e output corretto (label).",
    "Lezione 3: Obiettivo\n\nIl modello impara a prevedere l'output corretto per nuovi dati simili a quelli usati in addestramento.",
    "Lezione 4: Applicazioni comuni\n\nClassificazione di email come spam/non-spam, predizione del prezzo di case, riconoscimento di immagini.",
    // --- Domanda 1 ---
    "Lezione 5: Modelli comuni\n\nAlcuni modelli base sono: regressione lineare, regressione logistica, decision tree, k-nearest neighbors (k-NN).",
    "Lezione 6: Valutazione\n\nPer capire quanto è accurato un modello si usano metriche come accuracy, precision, recall e F1-score.",
    "Lezione 7: Overfitting\n\nSi verifica quando il modello si adatta troppo ai dati di training e non generalizza bene sui dati nuovi.",
    "Lezione 8: Prevenire overfitting\n\nSi possono usare tecniche come riduzione della complessità del modello, cross-validation, regularization e più dati di training.",
    // --- Domanda 2 ---
    "Lezione 9: Feature selection\n\nScegliere le caratteristiche più rilevanti può migliorare le prestazioni del modello.",
    "Lezione 10: Normalizzazione\n\nI dati numerici possono essere scalati per farli rientrare in un certo intervallo, migliorando l'addestramento.",
    "Lezione 11: Suddivisione dataset\n\nIl dataset viene diviso in training set e test set per valutare le performance in modo affidabile.",
    "Lezione 12: Riepilogo\n\nL'apprendimento supervisionato richiede dati etichettati, scelta del modello, addestramento e valutazione delle performance.",
  ];

  // Domande ogni 4 slide
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Qual è lo scopo principale dell'apprendimento supervisionato?",
      "options": [
        "Predire output a partire da dati etichettati",
        "Generare immagini realistiche",
        "Allenare modelli senza dati etichettati",
        "Creare reti neurali ricorrenti"
      ],
      "answer": 0,
    },
    {
      "question": "Quale tecnica aiuta a prevenire l'overfitting?",
      "options": [
        "Aumentare la complessità del modello",
        "Regularization",
        "Usare meno dati di training",
        "Ignorare la normalizzazione"
      ],
      "answer": 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apprendimento Supervisionato - Base"),
      ),
      body: Column(
        children: [
          // Indicatore di progresso
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Slide ${currentPage + 1} / ${slides.length + questions.length}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: slides.length + questions.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                int questionIndex = (index + 1) ~/ 5 - 1;
                if ((index + 1) % 5 == 0 && questionIndex < questions.length) {
                  final q = questions[questionIndex];
                  return QuestionCard(
                    question: q["question"],
                    options: List<String>.from(q["options"]),
                  );
                } else {
                  int slideIndex = index - questionIndex;
                  if (slideIndex >= slides.length) return const SizedBox();
                  return SlideCard(content: slides[slideIndex]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SlideCard extends StatelessWidget {
  final String content;
  const SlideCard({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            content,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  final String question;
  final List<String> options;
  const QuestionCard({super.key, required this.question, required this.options});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ...options.map((o) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(o),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
