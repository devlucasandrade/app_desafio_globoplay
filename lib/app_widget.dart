import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/provider/favorites_provider.dart';
import 'src/views/home/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavoritesProvider()),
      ],
      child: MaterialApp(
        title: 'Desafio Globoplay',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade900,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
            ),
          ),
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
