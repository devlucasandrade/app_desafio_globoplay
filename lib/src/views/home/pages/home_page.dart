import 'package:flutter/material.dart';
import '../../movies/pages/movies_favorite_page.dart';
import '../widgets/movies_futurebuilder.dart';
import '../widgets/tvshow_futurebuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final screens = [
    Column(
      children: const [
        MoviesFutureBuilder(),
        SizedBox(height: 20),
        TVShowFutureBuilder(),
      ],
    ),
    const MoviesFavoritePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('globloplay'),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Minha Lista',
          ),
        ],
      ),
    );
  }
}
