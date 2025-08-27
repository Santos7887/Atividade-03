import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BottomNav + TabBar Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Modulo1Screen(),
    const Modulo2Screen(),
    const Modulo3Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Módulo 1"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Módulo 2"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Módulo 3"),
        ],
      ),
    );
  }
}

class Modulo1Screen extends StatelessWidget {
  const Modulo1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Conteúdo do Módulo 1",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Modulo3Screen extends StatelessWidget {
  const Modulo3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Configurações / Outra tela",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}

class Modulo2Screen extends StatelessWidget {
  const Modulo2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 3 abas
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Módulo 2"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Tab A"),
              Tab(text: "Tab B"),
              Tab(text: "Tab C"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text("Conteúdo da Tab A", style: TextStyle(fontSize: 18))),
            Center(child: Text("Conteúdo da Tab B", style: TextStyle(fontSize: 18))),
            Center(child: Text("Conteúdo da Tab C", style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
