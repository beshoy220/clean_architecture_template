import 'package:clean_architecture_template/features/home/presentation/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late final provider = context.watch<StudentHomeProvider>();
    late final data = provider.studentHome;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Assignments: ${data?.assignmentsCount ?? 0}"),
            Text("Quizzes: ${data?.quizzesCount ?? 0}"),
            OutlinedButton(
              onPressed: () => provider.loadHomeDataProvider(),
              child: Text('Load Data'),
            ),

            OutlinedButton(onPressed: () async {}, child: Text('Save chahe')),
            OutlinedButton(onPressed: () async {}, child: Text('Load cache')),
          ],
        ),
      ),
    );
  }
}
