import 'package:flutter/material.dart';
import 'package:project2/data/questions.dart';

void main() {
  runApp(
    const MaterialApp(
      home: QuestionScreen(),
    ),
  );
}

// Stateless => Ekranda değişime uğramayacak, UI widget
// cmd + . ->itellisense

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz-logo.png", width: 250),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20)),
            ),
          ],
        ),
      ),
    );
  }
}

// Boilerplate

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int questinNo = 0;

  void changeQuestion() {
    setState(() {
      questinNo += 1;
    }); // değişikliklerin ekrana da yansıtılması için gerekli..
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beşiktaş Quiz"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(questions[questinNo].question),
          ...questions[questinNo].answers.map((answer) {
            return ElevatedButton(
                onPressed: () {
                  if (questinNo < 4) {
                    changeQuestion();
                  }
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ));
          })
        ]),
      ),
    );
  }
}
