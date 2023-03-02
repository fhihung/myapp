import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  final _questions = const [
    {
      'answerText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 10},
        {'text': 'Green', 'score': 5}
      ]
    },
    {
      'answerText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbt', 'score': 5},
        {'text': 'Cat', 'score': 5},
        {'text': 'Dragon', 'score': 10},
        {'text': 'Phoneix', 'score': 10}
      ]
    },
    {
      'answerText': 'Who\'s your favorite actor?',
      'answers': [
        {'text': 'A', 'score': 10},
        {'text': 'B', 'score': 10},
        {'text': 'C', 'score': 10},
        {'text': 'D', 'score': 10}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  // var dummy = ['Heloo'];
  // dummy.add('Max');
  // print(dummy);
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
