import 'package:flutter/material.dart';
import 'package:project2/home_screen.dart';
import 'package:project2/quiz_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

// callback function
class _SwiperScreenState extends State<SwiperScreen> {
  String activeScreenName = "home-screen";

  void goToQuiz() {
    setState(() {
      activeScreenName = "quiz-screen";
    });
  }
// StatefullWidget setState her yapıldığında build fonksiyonunu yeniden çalıştırır.
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = HomeScreen(goToQuiz); //

    if (activeScreenName == "quiz-screen") activeScreen = const QuizScreen();

    return Container(
      child: activeScreen,
    );
  }

}
