import 'models/exercise.dart';

class FavoritesArgs {
  final List<Exercise> items;
  final void Function(String id) onDelete;
  final void Function(String id) onToggleFavorite;
  final void Function(String id) onOpenDetail;

  FavoritesArgs({
    required this.items,
    required this.onDelete,
    required this.onToggleFavorite,
    required this.onOpenDetail,
  });
}

class ExerciseDetailArgs {
  final Exercise item;
  final void Function() onToggleFavorite;

  ExerciseDetailArgs({
    required this.item,
    required this.onToggleFavorite,
  });
}

class AddExerciseArgs {
  final void Function({
  required String title,
  required String description,
  required MuscleGroup muscle,
  required Equipment equipment,
  required Difficulty difficulty,
  }) onSave;

  AddExerciseArgs({required this.onSave});
}

class GalleryArgs {
  final bool hideBack;
  const GalleryArgs({this.hideBack = false});
}
