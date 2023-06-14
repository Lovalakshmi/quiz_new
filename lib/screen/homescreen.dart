import 'package:flutter/material.dart';
import 'dart:async';
import 'package:quiz_1/screen/levels.dart';
import 'package:quiz_1/screen/splashscreen.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String rollNo;

  HomeScreen({required this.name, required this.rollNo});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  int _selectedAnswerIndex = -1;
  int _score = 0;
  int _secondRemaining = 60;

  late Timer _timer;

  final List<Map<String, Object>> _questions = [
    {
      'question':
          'Question 1: Which programming language is used to build Flutter applications?',
      'answers': ['Kotlin', 'Dart', 'Java', 'Go'],
      'correctIndex': 1,
    },
    {
      'question': 'Question 2: How many types of widgets are there in Flutter?',
      'answers': ['5', '4', '2', '8+'],
      'correctIndex': 2,
    },
    {
      'question': 'Question 3: What is Flutter?',
      'answers': [
        'Flutter is an open-source backend development framework',
        'Flutter is an open-source UI toolkit',
        'Flutter is an open-source programming language for cross-platform applications',
        'Flutters is a DBMS toolkit'
      ],
      'correctIndex': 1,
    },
    {
      'question':
          'Question 4: Who developed the Flutter Framework and continues to maintain it today?',
      'answers': ['Google', 'Microsoft', 'Facebook', 'Oracle'],
      'correctIndex': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondRemaining > 0) {
          _secondRemaining--;
        } else {
          _timer.cancel();
          // Perform any action when the timer reaches 0
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed

    super.dispose();
  }

  void _answerQuestion(int selectedAnswerIndex) {
    setState(() {
      _selectedAnswerIndex = selectedAnswerIndex;

      if (_selectedAnswerIndex == _questions[_currentIndex]['correctIndex']) {
        _score++;
      }
    });
    _goToNextQuestion();
  }

  void _goToNextQuestion() {
    setState(() {
      _selectedAnswerIndex = -1;

      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
      } else {
        // Reached the end of the questions
        if (_score == _questions.length) {
          // All questions answered correctly
          _showWinDialog();
        } else {
          // Some questions answered incorrectly
          _showTryAgainDialog();
        }
        _timer.cancel(); //pause the timer
      }
    });
  }

  void _goToPreviousQuestion() {
    setState(() {
      _selectedAnswerIndex = -1;

      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  Widget _buildQuestion() {
    return Text(
      _questions[_currentIndex]['question'] as String,
      style: TextStyle(fontSize: 20),
    );
  }

  Widget _buildAnswers() {
    final List<String> answers =
        _questions[_currentIndex]['answers'] as List<String>;

    return Column(
      children: answers.asMap().entries.map((entry) {
        final int answerIndex = entry.key;
        final String answerText = entry.value;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: _selectedAnswerIndex == answerIndex
                  ? (answerIndex == _questions[_currentIndex]['correctIndex']
                      ? MaterialStateProperty.all<Color>(Colors.green)
                      : MaterialStateProperty.all<Color>(Colors.red))
                  : null,
            ),
            onPressed: () => _answerQuestion(answerIndex),
            child: Container(
                width: double.infinity, child: Center(child: Text(answerText))),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuestionNumbering() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question ${_currentIndex + 1} of ${_questions.length}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildAnsweredQuestionNumbering() {
    int answeredQuestions = _currentIndex + 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Answered: $answeredQuestions',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildNotAnsweredQuestionNumbering() {
    int notAnsweredQuestions = _questions.length - _currentIndex - 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Not Answered: $notAnsweredQuestions',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildScore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Score: $_score',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    int minutes = _secondRemaining ~/ 60;
    int seconds = _secondRemaining % 60;

    return Text(
      'Time Remaining: ${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: TextStyle(fontSize: 16),
    );
  }

  void _showWinDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'You Win!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push<void>(
                    //   context,
                    //   MaterialPageRoute<void>(
                    //     builder: (BuildContext context) => Level1Screen(),
                    //   ),
                    // );
                    // Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTryAgainDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Try Again',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'You answered some questions incorrectly. Please try again.',
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); //close the dialog
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Levels',
                style: TextStyle(fontSize: 24),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Level 1'),
              onTap: () {
                onTap:
                () {
                  Navigator.pushNamed(context,
                      '/level1'); // Replace '/level1' with the appropriate route for the level
                };
              },
            ),
            ListTile(
              title: Text('Level 2'),
              onTap: () {
                onTap:
                () {
                  Navigator.pushNamed(context,
                      '/level2'); // Replace '/level1' with the appropriate route for the level
                };
              },
            ),
            ListTile(
              title: Text('Level 3'),
              onTap: () {
                onTap:
                () {
                  Navigator.pushNamed(context,
                      '/level3'); // Replace '/level1' with the appropriate route for the level
                };
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTimer(),
            // _buildAnsweredQuestionNumbering(),
            //  _buildNotAnsweredQuestionNumbering(),
            SizedBox(height: 20),
            _buildQuestion(),
            SizedBox(height: 20),
            _buildAnswers(),
            SizedBox(height: 20),
            _buildQuestionNumbering(),
            SizedBox(height: 20),
            _buildScore(),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _goToPreviousQuestion,
                  child: Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: _goToNextQuestion,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
