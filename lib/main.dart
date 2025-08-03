import 'package:flutter/material.dart';
import 'questions.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Quiz App", //
              style: TextStyle(
                fontSize: 30,
                color: Colors.white, //
              ),
            ),
          ),
          backgroundColor: Colors.teal, //
        ),
        body: QuizApp(),
      ),
    ),
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Icon> iconManager = [];
  int questionNumber = 0;
  int score = 0;
  bool gameFinished = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (gameFinished) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "YOUR SCORE : $score",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.lightBlueAccent, //
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                gameFinished = false;
                questionNumber = 0;
                score = 0;
                iconManager.clear();
              });
            }, //
            icon: Icon(Icons.refresh),
            iconSize: 40,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white, //
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: SizedBox(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: iconManager), //
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10), //
            child: Center(
              child: Text(
                questionBank[questionNumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white, //
                ),
              ), //
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () {
                    checkAnswer(true);
                  }, //
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green, //
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "True",
                    style: TextStyle(
                      fontSize: 25, //
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Center(
              child: SizedBox.expand(
                child: TextButton(
                  onPressed: () {
                    checkAnswer(false);
                  }, //
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red, //
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Text(
                    "False",
                    style: TextStyle(
                      fontSize: 25, //
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(children: iconManager),
      ],
    );
  }

  void checkAnswer(bool userPicked) {
    bool correctAnswer = questionBank[questionNumber].answer;
    setState(() {
      if (userPicked == correctAnswer) {
        iconManager.add(
          Icon(
            Icons.check, //
            color: Colors.green,
          ),
        );
        score += 1;
      } else {
        iconManager.add(
          Icon(
            Icons.close,
            color: Colors.red, //
          ),
        );
      }

      if (questionNumber < (questionBank.length - 1)) {
        questionNumber += 1;
      } else {
        gameFinished = true;
      }
    });
  }
}
