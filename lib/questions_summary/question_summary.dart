import 'package:flutter/material.dart';
import 'package:flutter_quizz/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer = itemData['correct_answer'] == itemData['user_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: itemData['question_index'] as int,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(itemData['question'] as String),
              const SizedBox(height: 5),
              Text('Your Answer: ${itemData['user_answer']}'),
              Text('Correct Answer: ${itemData['correct_answer']}'),
            ],
          ),
        ),
      ],
    );
  }
}