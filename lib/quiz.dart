import 'package:flutter/material.dart';
import 'package:flutter_quizz/questions_screen.dart';
import 'start_screen.dart';
import 'package:flutter_quizz/data/questions.dart';
import 'package:flutter_quizz/results_screen.dart';


  class Quiz extends StatefulWidget {
    const Quiz({super.key});

    @override
    State<Quiz> createState() {
      return _QuizState();
    }
  }

  class _QuizState extends State<Quiz> {
     List<String> _selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen(){
      setState(() {
        activeScreen ='questions-screen';
      });
    }

    void chooseAnswer (String answer){
      _selectedAnswers.add(answer);

      if (_selectedAnswers.length == questions.length){
        setState(() {
          activeScreen ='results-screen';

        });
      };
    }

     void restartQuiz (){
       setState(() {
         _selectedAnswers =[];
         activeScreen = 'questions-screen';
       });
     }

     @override
    Widget build(BuildContext context) {

      Widget screenWidget = StartScreen(switchScreen);

      if (activeScreen=='questions-screen'){
        screenWidget = QuestionsScreen(onSelectAnswer:chooseAnswer);
      }

      if (activeScreen == 'results-screen'){
        screenWidget = ResultsScreen(
            chosenAnswers: _selectedAnswers, onRestart: restartQuiz,

        );
      }

      return MaterialApp(
          home: Scaffold(
              backgroundColor: Colors.transparent,
            body: Container(
              width: double.infinity,
              height: double.infinity,
                decoration:BoxDecoration(
                  gradient: LinearGradient(
                    colors:[Colors.deepPurple,Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                ) ,
                child:screenWidget ,
          )
          )
      );
    }
  }
