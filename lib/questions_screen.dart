  import 'package:flutter/material.dart';
  import 'package:flutter_quizz/answer_button.dart';
  import 'package:flutter_quizz/data/questions.dart';
  import 'package:google_fonts/google_fonts.dart';



  class QuestionsScreen extends StatefulWidget {
    const QuestionsScreen({super.key,required this.onSelectAnswer});
    final void Function(String answer) onSelectAnswer;
  
    @override
    State<QuestionsScreen> createState() {
      return _QuestionsScreenState();
    }
  }
  
  class _QuestionsScreenState extends State<QuestionsScreen> {

    var currentQuestionIndex = 0;

    void answerQuestion(String selectedAnswer){
        widget.onSelectAnswer(selectedAnswer);
      setState(() {
        currentQuestionIndex += 1;
        //currentQuestionIndex = currentQuestionIndex +1;
      });
    }
    @override
    Widget build(BuildContext context) {
      final currentQuestion = questions[currentQuestionIndex];
      return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(currentQuestion.text,
                textAlign: TextAlign.center,
                style:GoogleFonts.lato(
                  color: Colors.lightBlueAccent,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
              SizedBox(height: 30,),
              ...currentQuestion.shuffledAnswers.map((answer){
                return AnswerButton(answerText: answer, onTap:(){
                  answerQuestion(answer);
                });
              })
          
            ],
          ),
        ),
      );
    }
  }
  