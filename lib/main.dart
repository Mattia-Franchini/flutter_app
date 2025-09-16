import 'package:flutter/material.dart';
import 'pages/profile_page.dart';
import 'pages/home_page.dart';
import 'pages/wip_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Bottom Bar',
      theme: ThemeData(
        useMaterial3: true, // Attiva il design Material 3
        colorSchemeSeed: Colors.indigo, // Colore principale
        brightness: Brightness.light,
      ),
      home: const ModernNav(),
    );
  }
}

class ModernNav extends StatefulWidget {
  const ModernNav({super.key});

  @override
  State<ModernNav> createState() => _ModernNavState();
}

class _ModernNavState extends State<ModernNav> {
  int _currentIndex = 1; // 1 = Home come default

  final List<Widget> _pages = const [
    WipPage(),
    HomePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar trasparente per un look moderno
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: _pages[_currentIndex],

      // Bottom Navigation moderna
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            backgroundColor: Theme.of(context).colorScheme.surface,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor:
                Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.construction_outlined),
                label: 'WIP',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Profilo',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
