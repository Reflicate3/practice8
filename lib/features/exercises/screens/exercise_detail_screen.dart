import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/exercise.dart';
import '../data/exercises_repository.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise item;

  const ExerciseDetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<ExercisesRepository>();
    return AnimatedBuilder(
      animation: repo, // пересобираем экран при notifyListeners()
      builder: (context, _) {
        final current = repo.byId(item.id) ?? item;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Детали упражнения'),
            actions: [
              IconButton(
                tooltip: current.isFavorite ? 'Убрать из избранного' : 'В избранное',
                icon: Icon(current.isFavorite ? Icons.favorite : Icons.favorite_border),
                onPressed: () => GetIt.I<ExercisesRepository>().toggleFavorite(current.id),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(current.title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text(muscleLabel(current.muscle))),
                  Chip(label: Text(equipmentLabel(current.equipment))),
                  Chip(label: Text(difficultyLabel(current.difficulty))),
                ],
              ),
              const SizedBox(height: 16),
              Text(current.description),
            ],
          ),
        );
      },
    );
  }
}
