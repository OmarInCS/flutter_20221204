
// widget
  // stateful
  // stateless

import 'dart:math';

import 'package:flutter/material.dart';

class GuessGameScreen extends StatefulWidget {
  const GuessGameScreen({Key? key}) : super(key: key);

  @override
  State<GuessGameScreen> createState() => _GuessGameScreenState();
}

class _GuessGameScreenState extends State<GuessGameScreen> {

  var _message = "Guess a num btw 0-100";
  var _imgPath = "images/think.png";
  var _txtColor = Colors.red;
  var _randGen = Random();
  var _number;
  var _tfController = TextEditingController();
  var hideButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _number = _randGen.nextInt(100);
  }

  void _checkAnswer([String? text]) {
    var answer = int.parse(_tfController.text);

    if (answer > _number) {
      _message = "Guess a smaller number";
    }
    else if (answer < _number) {
      _message = "Guess a greater number";
    }
    else {
      _message = "You Guessed Right!!";
      _imgPath = "images/happy.png";
      _txtColor = Colors.green;
      hideButton = true;
    }

    setState(() {

    });
  }

  void _playAgain()
  {
    setState(()
    {
      _message = "Guess the number Between 0-100";
      _imgPath = "image/think.png";
      _txtColor = Colors.indigo;
      _number = _randGen.nextInt(100);
      hideButton = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess Game"),
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt),
            onPressed: _playAgain,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message,
              style: TextStyle(
                fontSize: 24,
                color: _txtColor
              ),
            ),
            Image.asset(_imgPath),
            SizedBox(height: 16,),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Eg.: 50, 75, 33"
              ),
              keyboardType: TextInputType.number,
              controller: _tfController,
              onSubmitted: _checkAnswer,
            ),
            SizedBox(height: 16,),
            if (!hideButton)
              ElevatedButton(
                child: Text("Click Me"),
                onPressed: _checkAnswer,
              )
          ],
        ),
      ),
    );
  }
}

