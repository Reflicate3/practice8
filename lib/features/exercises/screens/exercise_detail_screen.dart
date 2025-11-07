import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../data/exercises_scope.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise item;

  const ExerciseDetailScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final repo = ExercisesScope.of(context); // подпишемся на изменения
    final current = repo.byId(item.id) ?? item;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали упражнения'),
        actions: [
          IconButton(
            tooltip: current.isFavorite ? 'Убрать из избранного' : 'В избранное',
            icon: Icon(current.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () => ExercisesScope.read(context).toggleFavorite(current.id),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(current.title, style: theme.textTheme.headlineSmall),
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
  }
}
