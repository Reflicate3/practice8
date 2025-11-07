import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/exercise.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final Exercise item;
  final VoidCallback onToggleFavorite;

  const ExerciseDetailScreen({
    super.key,
    required this.item,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: Text(item.title),
        actions: [
          IconButton(
            tooltip: item.isFavorite ? 'Убрать из избранного' : 'В избранное',
            icon: Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: onToggleFavorite,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(item.title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _ChipTag(label: 'Мышцы: ${_muscleName(item.muscle)}'),
              _ChipTag(label: 'Оборудование: ${_equipName(item.equipment)}'),
              _ChipTag(label: 'Сложность: ${_diffName(item.difficulty)}'),
            ],
          ),
          const SizedBox(height: 16),
          Text(item.description, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

class _ChipTag extends StatelessWidget {
  final String label;
  const _ChipTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      side: BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
    );
  }
}

String _muscleName(MuscleGroup g) => switch (g) {
  MuscleGroup.chest => 'Грудь',
  MuscleGroup.back => 'Спина',
  MuscleGroup.legs => 'Ноги',
  MuscleGroup.shoulders => 'Плечи',
  MuscleGroup.arms => 'Руки',
  MuscleGroup.core => 'Кор',
  MuscleGroup.fullBody => 'Все тело',
};

String _equipName(Equipment e) => switch (e) {
  Equipment.bodyweight => 'Собственный вес',
  Equipment.dumbbell => 'Гантели',
  Equipment.barbell => 'Штанга',
  Equipment.machine => 'Тренажёр',
  Equipment.band => 'Эспандер',
  Equipment.kettlebell => 'Гиря',
};

String _diffName(Difficulty d) => switch (d) {
  Difficulty.beginner => 'Начальный',
  Difficulty.intermediate => 'Средний',
  Difficulty.advanced => 'Продвинутый',
};
