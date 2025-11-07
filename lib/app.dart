import 'package:flutter/material.dart';
import 'features/exercises/screens/exercises_container.dart';

// NEW:
import 'features/exercises/data/exercises_repository.dart';
import 'features/exercises/data/exercises_scope.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ExercisesScope(
      repository: ExercisesRepository(),
      child: MaterialApp(
        title: 'Справочник упражнений',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        home: const ExercisesContainer(),
      ),
    );
  }
}
