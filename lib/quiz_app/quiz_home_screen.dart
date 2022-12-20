
import 'package:app20221204/quiz_app/quiz_screen.dart';
import 'package:flutter/material.dart';

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen({Key? key}) : super(key: key);

  static const _levels = ["Easy", "Normal", "Hard"];

  @override
  Widget build(BuildContext context) {

    var isWide = MediaQuery.of(context).size.width > 500;
    var buttons = [
      for (var level in _levels)
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                  level
              ),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QuizScreen(level),));
            },

          ),
        )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: !isWide ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buttons,
          )
            : Center(
              child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttons,
        ),
            )
      ),
    );
  }
}
