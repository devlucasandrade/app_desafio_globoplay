import 'package:flutter/material.dart';
import 'movies/widgets/futurebuilder.dart';
import 'tvshows/widgets/futurebuilder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('globloplay'),
        centerTitle: true,
      ),
      body: Column(
        children: const [
          MoviesFutureBuilder(),
          SizedBox(height: 20),
          TVShowFutureBuilder(),
        ],
      ),
    );
  }
}
