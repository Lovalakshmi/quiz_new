// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:quiz_1/screen/homescreen.dart';

// class Level1Screen extends StatefulWidget {
//   @override
//   _Level1ScreenState createState() => _Level1ScreenState();
// }

// class _Level1ScreenState extends State<Level1Screen>
//     with TickerProviderStateMixin {
//   int _currentIndex = 0;
//   int _selectedAnswerIndex = -1;
//   int _score = 0;
//   int _secondRemaining = 10;
//   late Timer _timer;
//   bool _isLevel1Completed = false;

//   final List<Map<String, Object>> _questions = [
//     {
//       'question':
//           'Question 1: A sequence of asynchronous Flutter events is known as a_________?',
//       'answers': [' Flow', 'Current', ' Stream', 'Series'],
//       'correctIndex': 2,
//     },
//     {
//       'question':
//           'Question 2: What element is used as an identifier for components when programming in Flutter?',
//       'answers': ['  Widgets', ' Keys', ' Elements', 'Serial'],
//       'correctIndex': 1,
//     },
//     {
//       'question':
//           'Question 3: What type of Flutter animation allows you to represent real-world behavior?',
//       'answers': [
//         '  Physics-based',
//         ' Maths-based',
//         '  Graph-based',
//         'Sim-based'
//       ],
//       'correctIndex': 0,
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondRemaining > 0) {
//           _secondRemaining--;
//         } else {
//           _timer.cancel();
//           _goToNextQuestion();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _answerQuestion(int selectedAnswerIndex) {
//     setState(() {
//       _selectedAnswerIndex = selectedAnswerIndex;

//       if (_selectedAnswerIndex == _questions[_currentIndex]['correctIndex']) {
//         _score++;
//       }
//     });
//   }

//   void _goToNextQuestion() {
//     setState(() {
//       _selectedAnswerIndex = -1;
//       _secondRemaining = 10;

//       if (_currentIndex < _questions.length - 1) {
//         _currentIndex++;
//       } else {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             _isLevel1Completed = true;
//             return AlertDialog(
//               title: Text('Level 1 Completed'),
//               content: Text('Your score: $_score'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     // Navigate to the next level or do something else
//                   },
//                   child: Text('Close'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     });
//   }

//   void _goToPreviousQuestion() {
//     setState(() {
//       _selectedAnswerIndex = -1;
//       _secondRemaining = 10;

//       if (_currentIndex > 0) {
//         _currentIndex--;
//       }
//     });
//   }

//   Widget _buildQuestion() {
//     return Text(
//       _questions[_currentIndex]['question'] as String,
//       style: TextStyle(fontSize: 20),
//     );
//   }

//   Widget _buildAnswers() {
//     final List<String> answers =
//         _questions[_currentIndex]['answers'] as List<String>;

//     return Column(
//       children: answers.asMap().entries.map((entry) {
//         final int answerIndex = entry.key;
//         final String answerText = entry.value;

//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: _selectedAnswerIndex == answerIndex
//                   ? (answerIndex == _questions[_currentIndex]['correctIndex']
//                       ? MaterialStateProperty.all<Color>(Colors.green)
//                       : MaterialStateProperty.all<Color>(Colors.red))
//                   : null,
//             ),
//             onPressed: () => _answerQuestion(answerIndex),
//             child: Text(answerText),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildScore() {
//     return Text(
//       'Score: $_score',
//       style: TextStyle(fontSize: 16),
//     );
//   }

//   Widget _buildTimer() {
//     return Text(
//       'Time remaining: $_secondRemaining seconds',
//       style: TextStyle(fontSize: 16),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Level 1')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildTimer(),
//             SizedBox(height: 20),
//             _buildQuestion(),
//             SizedBox(height: 20),
//             _buildAnswers(),
//             SizedBox(height: 20),
//             _buildScore(),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: _goToPreviousQuestion,
//                   child: Text('Previous'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _goToNextQuestion,
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Level2Screen extends StatefulWidget {
//   @override
//   _Level2ScreenState createState() => _Level2ScreenState();
// }

// class _Level2ScreenState extends State<Level1Screen>
//     with TickerProviderStateMixin {
//   int _currentIndex = 0;
//   int _selectedAnswerIndex = -1;
//   int _score = 0;
//   int _secondRemaining = 10;
//   late Timer _timer;
//   bool _isLevel2Completed = false;

//   final List<Map<String, Object>> _questions = [
//     {
//       'question':
//           'Question 1: Which component allows us to specify the distance between widgets on the screen?',
//       'answers': ['SafeArea', 'SizedBox', 'table', 'AppBar'],
//       'correctIndex': 1,
//     },
//     {
//       'question':
//           'Question 2: True or false: Flutter boasts improved runtime performance over most application frameworks.',
//       'answers': [
//         'True',
//         'False',
//       ],
//       'correctIndex': 0,
//     },
//     {
//       'question':
//           'Question 3: What is the key configuration file used when building a Flutter project?',
//       'answers': ['pubspec.yaml', 'pubspec.xml', 'config.html', ' root.xml'],
//       'correctIndex': 0,
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondRemaining > 0) {
//           _secondRemaining--;
//         } else {
//           _timer.cancel();
//           _goToNextQuestion();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _answerQuestion(int selectedAnswerIndex) {
//     setState(() {
//       _selectedAnswerIndex = selectedAnswerIndex;

//       if (_selectedAnswerIndex == _questions[_currentIndex]['correctIndex']) {
//         _score++;
//       }
//     });
//   }

//   void _goToNextQuestion() {
//     setState(() {
//       _selectedAnswerIndex = -1;
//       _secondRemaining = 10;

//       if (_currentIndex < _questions.length - 1) {
//         _currentIndex++;
//       } else {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             _isLevel2Completed = true;
//             return AlertDialog(
//               title: Text('Level 2 Completed'),
//               content: Text('Your score: $_score'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     // Navigate to the next level or do something else
//                   },
//                   child: Text('Close'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     });
//   }

//   void _goToPreviousQuestion() {
//     setState(() {
//       _selectedAnswerIndex = -1;
//       _secondRemaining = 10;

//       if (_currentIndex > 0) {
//         _currentIndex--;
//       }
//     });
//   }

//   Widget _buildQuestion() {
//     return Text(
//       _questions[_currentIndex]['question'] as String,
//       style: TextStyle(fontSize: 20),
//     );
//   }

//   Widget _buildAnswers() {
//     final List<String> answers =
//         _questions[_currentIndex]['answers'] as List<String>;

//     return Column(
//       children: answers.asMap().entries.map((entry) {
//         final int answerIndex = entry.key;
//         final String answerText = entry.value;

//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: _selectedAnswerIndex == answerIndex
//                   ? (answerIndex == _questions[_currentIndex]['correctIndex']
//                       ? MaterialStateProperty.all<Color>(Colors.green)
//                       : MaterialStateProperty.all<Color>(Colors.red))
//                   : null,
//             ),
//             onPressed: () => _answerQuestion(answerIndex),
//             child: Text(answerText),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildScore() {
//     return Text(
//       'Score: $_score',
//       style: TextStyle(fontSize: 16),
//     );
//   }

//   Widget _buildTimer() {
//     return Text(
//       'Time remaining: $_secondRemaining seconds',
//       style: TextStyle(fontSize: 16),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Level 1')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildTimer(),
//             SizedBox(height: 20),
//             _buildQuestion(),
//             SizedBox(height: 20),
//             _buildAnswers(),
//             SizedBox(height: 20),
//             _buildScore(),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: _goToPreviousQuestion,
//                   child: Text('Previous'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _goToNextQuestion,
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Level3Screen extends StatefulWidget {
//   @override
//   _Level3ScreenState createState() => _Level3ScreenState();
// }

// class _Level3ScreenState extends State<Level1Screen>
//     with TickerProviderStateMixin {
//   int _currentIndex = 0;
//   int _selectedAnswerIndex = -1;
//   int _score = 0;
//   int _secondRemaining = 10;
//   late Timer _timer;

//   final List<Map<String, Object>> _questions = [
//     {
//       'question':
//           'Question 1: Which release mode will not contain any debugging data when run?',
//       'answers': [' Profile', ' Debug', ' Release', 'Test'],
//       'correctIndex': 2,
//     },
//     {
//       'question':
//           'Question 2: True or False: Flutter supports desktop application development.',
//       'answers': [' True', '  False'],
//       'correctIndex': 0,
//     },
//     {
//       'question':
//           'Question 3: What widget would you use for repeating content in Flutter?',
//       'answers': [' ExpandedView', '  ListView', ' Stack', 'ArrayView'],
//       'correctIndex': 1,
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startTimer();
//   }

//   void _startTimer() {
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_secondRemaining > 0) {
//           _secondRemaining--;
//         } else {
//           _timer.cancel();
//           _goToNextQuestion();
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   void _answerQuestion(int selectedAnswerIndex) {
//     setState(() {
//       _selectedAnswerIndex = selectedAnswerIndex;

//       if (_selectedAnswerIndex == _questions[_currentIndex]['correctIndex']) {
//         _score++;
//       }
//     });
//   }

//   void _goToNextQuestion() {
//     setState(() {
//       _selectedAnswerIndex = -1;
//       _secondRemaining = 10;

//       if (_currentIndex < _questions.length - 1) {
//         _currentIndex++;
//       } else {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Level 3 Completed'),
//               content: Text('Your score: $_score'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                     // Navigate to the next level or do something else
//                   },
//                   child: Text('Close'),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     });
//   }

//   void _goToPreviousQuestion() {
//     setState(() {
//       _selectedAnswerIndex = -1;
//       _secondRemaining = 10;

//       if (_currentIndex > 0) {
//         _currentIndex--;
//       }
//     });
//   }

//   Widget _buildQuestion() {
//     return Text(
//       _questions[_currentIndex]['question'] as String,
//       style: TextStyle(fontSize: 20),
//     );
//   }

//   Widget _buildAnswers() {
//     final List<String> answers =
//         _questions[_currentIndex]['answers'] as List<String>;

//     return Column(
//       children: answers.asMap().entries.map((entry) {
//         final int answerIndex = entry.key;
//         final String answerText = entry.value;

//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: _selectedAnswerIndex == answerIndex
//                   ? (answerIndex == _questions[_currentIndex]['correctIndex']
//                       ? MaterialStateProperty.all<Color>(Colors.green)
//                       : MaterialStateProperty.all<Color>(Colors.red))
//                   : null,
//             ),
//             onPressed: () => _answerQuestion(answerIndex),
//             child: Text(answerText),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   Widget _buildScore() {
//     return Text(
//       'Score: $_score',
//       style: TextStyle(fontSize: 16),
//     );
//   }

//   Widget _buildTimer() {
//     return Text(
//       'Time remaining: $_secondRemaining seconds',
//       style: TextStyle(fontSize: 16),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Level 1')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             _buildTimer(),
//             SizedBox(height: 20),
//             _buildQuestion(),
//             SizedBox(height: 20),
//             _buildAnswers(),
//             SizedBox(height: 20),
//             _buildScore(),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: _goToPreviousQuestion,
//                   child: Text('Previous'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _goToNextQuestion,
//                   child: Text('Next'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
