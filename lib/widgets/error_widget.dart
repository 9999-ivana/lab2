import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final String message;

  ErrorWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.red, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}