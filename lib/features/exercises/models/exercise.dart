import 'package:flutter/material.dart';

enum Difficulty { beginner, intermediate, advanced }
enum Equipment { bodyweight, dumbbell, barbell, machine, band, kettlebell }
enum MuscleGroup { chest, back, legs, shoulders, arms, core, fullBody }

@immutable
class Exercise {
  final String id;
  final String title;
  final MuscleGroup muscle;
  final Equipment equipment;
  final Difficulty difficulty;
  final String description;
  final bool isFavorite;
  final DateTime createdAt;

  const Exercise({
    required this.id,
    required this.title,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.description,
    this.isFavorite = false,
    required this.createdAt,
  });

  Exercise copyWith({
    String? id,
    String? title,
    MuscleGroup? muscle,
    Equipment? equipment,
    Difficulty? difficulty,
    String? description,
    bool? isFavorite,
    DateTime? createdAt,
  }) =>
      Exercise(
        id: id ?? this.id,
        title: title ?? this.title,
        muscle: muscle ?? this.muscle,
        equipment: equipment ?? this.equipment,
        difficulty: difficulty ?? this.difficulty,
        description: description ?? this.description,
        isFavorite: isFavorite ?? this.isFavorite,
        createdAt: createdAt ?? this.createdAt,
      );
}

String difficultyLabel(Difficulty d) {
  switch (d) {
    case Difficulty.beginner:
      return 'Новичок';
    case Difficulty.intermediate:
      return 'Средний';
    case Difficulty.advanced:
      return 'Продвинутый';
  }
}

String equipmentLabel(Equipment e) {
  switch (e) {
    case Equipment.bodyweight:
      return 'Собственный вес';
    case Equipment.dumbbell:
      return 'Гантели';
    case Equipment.barbell:
      return 'Штанга';
    case Equipment.machine:
      return 'Тренажёр';
    case Equipment.band:
      return 'Эспандер';
    case Equipment.kettlebell:
      return 'Гиря';
  }
}

String muscleLabel(MuscleGroup m) {
  switch (m) {
    case MuscleGroup.chest:
      return 'Грудь';
    case MuscleGroup.back:
      return 'Спина';
    case MuscleGroup.legs:
      return 'Ноги';
    case MuscleGroup.shoulders:
      return 'Плечи';
    case MuscleGroup.arms:
      return 'Руки';
    case MuscleGroup.core:
      return 'Кор';
    case MuscleGroup.fullBody:
      return 'Все тело';
  }
}
