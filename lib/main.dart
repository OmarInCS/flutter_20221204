import 'package:app20221204/guess_game.dart';
import 'package:app20221204/quiz_app/quiz_home_screen.dart';
import 'package:app20221204/toggl_clone_app/screens/toggl_home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                  fontSize: 36
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              )
          ),
        ),
        cardTheme: CardTheme(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Colors.blue,
              width: 2
            )
          )
        )
      ),
      // home: GuessGameScreen(),
      // home: QuizHomeScreen(),
      home: TogglHomeScreen(),
    );
  }
}

