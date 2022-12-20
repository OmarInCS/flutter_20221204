
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String level;
  const QuizScreen(this.level, {Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  var _x, _y;
  var _randGen = Random();
  List<int> _choices = [];
  var _colors = [
    Colors.red, Colors.green, Colors.blueAccent, Colors.orangeAccent
  ];
  var _count = 0, _correct = 0;
  var _timer, _seconds;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _generateQuestion();
    _initTimer();
  }

  void _generateQuestion() {
    _count++;
    _x = _randGen.nextInt(10);
    _y = _randGen.nextInt(10);
    _choices = [_x * _y];

    for (int i = 0; i <3; i++) {
      var n = _randGen.nextInt(100);
      _choices.add(n);
    }

    _choices.shuffle();
  }

  void _checkChoice(int idx) {
    var answer = _choices[idx];
    var message;
    if (answer == _x*_y) {
      message = "Correct Answer";
      _correct++;
    }
    else {
      message = "Wrong Answer";
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ));
  }

  void _checkEndOfQuiz() {
    _timer.cancel();
    if (_count == 5) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Your Score"),
          content: Text("Your score is: $_correct out of 5"),
          actions: [
            TextButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName("/"));
              },
            )
          ],
        ),
      );
      return;
    }

    _generateQuestion();
    _initTimer();
    setState(() {

    });
  }

  void _initTimer() {
    if (widget.level == "Easy") {
      _seconds = 30;
    }
    else if (widget.level == "Normal") {
      _seconds = 15;
    }
    else {
      _seconds = 5;
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (_seconds == 0) {
        _checkEndOfQuiz();
      }
      else {
        _seconds--;
        setState(() {

        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    var isWide = MediaQuery.of(context).size.width > 500;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, bottom: 8, left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("What's $_x * $_y ?",
              style: TextStyle(
                fontSize: 36
              ),
            ),
            Text("$_seconds",
              style: TextStyle(
                fontSize: 32
              ),
            ),
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWide ? 4 : 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8
              ),
              itemBuilder: (context, index) => ElevatedButton(
                child: Text("${_choices[index]}"),
                onPressed: () {
                  _checkChoice(index);
                  _checkEndOfQuiz();

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colors[index]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
