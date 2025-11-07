import 'package:flutter/foundation.dart';
import '../models/exercise.dart';
import 'exercises_seed.dart';

class ExercisesRepository extends ChangeNotifier {
  ExercisesRepository({List<Exercise>? initial})
      : _items = List<Exercise>.from(initial ?? seedExercises);

  final List<Exercise> _items;

  List<Exercise> get all => List.unmodifiable(_items);

  Exercise? byId(String id) {
    try {
      return _items.firstWhere((e) => e.id == id);
    } catch (_) {
      return null;
    }
  }

  void add({
    required String title,
    required String description,
    required MuscleGroup muscle,
    required Equipment equipment,
    required Difficulty difficulty,
  }) {
    final ex = Exercise(
      id: 'ex_${DateTime.now().microsecondsSinceEpoch}',
      title: title,
      muscle: muscle,
      equipment: equipment,
      difficulty: difficulty,
      description: description,
      isFavorite: false,
      createdAt: DateTime.now(),
    );
    _items.insert(0, ex);
    notifyListeners();
  }

  void remove(String id) {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void toggleFavorite(String id) {
    final i = _items.indexWhere((e) => e.id == id);
    if (i != -1) {
      _items[i] = _items[i].copyWith(isFavorite: !_items[i].isFavorite);
      notifyListeners();
    }
  }
}
