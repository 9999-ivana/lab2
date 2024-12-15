import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke.dart';

class JokesByTypeScreen extends StatelessWidget {
  final String type;

  JokesByTypeScreen({required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jokes: $type'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        toolbarHeight: 75,
      ),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.getJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Грешка зa вчитување jokes'));
          } else {
            final jokes = snapshot.data!;
            return ListView.builder(
              itemCount: jokes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    shape: Border.all(color: Colors.white, style: BorderStyle.solid),
                    contentPadding: EdgeInsets.all(15),
                    titleTextStyle: TextStyle(fontSize: 25),
                    subtitleTextStyle: TextStyle(fontSize: 17),
                    title: Text(jokes[index].setup),
                    subtitle: Text(jokes[index].punchline),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}