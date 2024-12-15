//Ivana Savikj - 181028 - Laboratoriska 2

import 'package:flutter/material.dart';
import 'screens/joke_types_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лабораториска 2 - 181028 - Joke App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.dark(),
          scaffoldBackgroundColor: Colors.blueGrey
      ),
      home: JokeTypesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}