import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

  class StartScreen extends StatelessWidget {
    StartScreen( this.startQuiz,{super.key});

  final void Function() startQuiz;

    @override
    Widget build(BuildContext context) {
      return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/quiz-logo.png',width: 300,color: Colors.white,),
              SizedBox(height: 80,),
              Text("Learn Flutter the fun way!",
                style: GoogleFonts.lato(color: Colors.white,fontSize: 24),),
              SizedBox(height: 30,),
              OutlinedButton.icon(onPressed: startQuiz,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black54,
                  ),
                  icon: Icon(Icons.keyboard_arrow_right),
                 label: Text("Start Quiz"))
              
            ],
          ));
    }
  }

