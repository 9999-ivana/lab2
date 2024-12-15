import 'package:flutter/material.dart';
import '../models/joke.dart';

class RandomJokeScreen extends StatelessWidget {
  final Joke joke;

  RandomJokeScreen({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Joke'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        toolbarHeight: 75,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              joke.setup,
              style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, backgroundColor: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            Text(
              joke.punchline,
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold, backgroundColor: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}