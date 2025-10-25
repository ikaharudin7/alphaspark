import 'package:flutter/material.dart';

import '../../../core/widgets/empty_state_widget.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Question of the Day'),
      ),
      body: const EmptyStateWidget(
        title: 'Coming Soon',
        subtitle: 'Question of the day feature will be available soon!',
        icon: Icons.question_mark,
      ),
    );
  }
}