import 'package:flutter/material.dart';
import '../services/api_services.dart';
import 'jokes_by_type_screen.dart';
import 'random_joke_screen.dart';

class JokeTypesScreen extends StatefulWidget {
  @override
  _JokeTypesScreenState createState() => _JokeTypesScreenState();
}

class _JokeTypesScreenState extends State<JokeTypesScreen> {
  List<String> jokeTypes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchJokeTypes();
  }

  void fetchJokeTypes() async {
    try {
      final types = await ApiService.getJokeTypes();
      setState(() {
        jokeTypes = types;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Грешка за приказ на joke types')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke App - 181028'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 30),
        toolbarHeight: 75,
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: () async {
              try {
                final joke = await ApiService.getRandomJoke();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RandomJokeScreen(joke: joke),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Грешка за приказ на random joke')),
                );
              }
            },
          ),
        ],
      ),
      body:
      isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: jokeTypes.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              shape: Border.all(color: Colors.white, style: BorderStyle.solid),
              minVerticalPadding: 20,
              contentPadding: EdgeInsets.all(20),
              title: Text(jokeTypes[index], textAlign: TextAlign.center),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 40, letterSpacing: 1 ),


              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => JokesByTypeScreen(type: jokeTypes[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}