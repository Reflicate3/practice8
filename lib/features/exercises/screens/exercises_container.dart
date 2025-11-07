import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../data/exercises_scope.dart';

import 'exercises_list_screen.dart';
import 'add_exercise_screen.dart';
import 'exercise_detail_screen.dart';
import 'favorites_screen.dart';
import 'about_screen.dart';
import 'gallery_screen.dart';
import '../widgets/scope_badge.dart';

class ExercisesContainer extends StatefulWidget {
  const ExercisesContainer({super.key});

  @override
  State<ExercisesContainer> createState() => _ExercisesContainerState();
}

class _ExercisesContainerState extends State<ExercisesContainer> {
  String _q = '';
  final Set<Difficulty> _diff = {};
  final Set<Equipment> _equip = {};
  MuscleGroup? _muscle;
  bool _filtersExpanded = false;

  List<Exercise> get _all => ExercisesScope.of(context).all;

  List<Exercise> get _visible {
    return _all.where((e) {
      final byQuery = _q.isEmpty ||
          e.title.toLowerCase().contains(_q) ||
          e.description.toLowerCase().contains(_q);
      final byDiff = _diff.isEmpty || _diff.contains(e.difficulty);
      final byEquip = _equip.isEmpty || _equip.contains(e.equipment);
      final byMuscle = _muscle == null || _muscle == e.muscle;
      return byQuery && byDiff && byEquip && byMuscle;
    }).toList();
  }

  void _openDetailById(String id) {
    final ex = ExercisesScope.read(context).byId(id);
    if (ex == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ExerciseDetailScreen(item: ex),
      ),
    );
  }

  void _openAdd() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AddExerciseScreen()),
    );
  }

  void _openFavorites() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const FavoritesScreen()),
    );
  }

  void _openAbout() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AboutScreen()),
    );
  }

  void _openGallery() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const GalleryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ExercisesListScreen(
            items: _visible,
            query: _q,
            selectedDifficulties: _diff,
            selectedEquipment: _equip,
            selectedMuscle: _muscle,
            onSearch: (q) => setState(() => _q = q.trim().toLowerCase()),
            onToggleDifficulty: (d) => setState(() => _diff.toggle(d)),
            onToggleEquipment: (e) => setState(() => _equip.toggle(e)),
            onSelectMuscle: (m) => setState(() => _muscle = m),
            onAddTap: _openAdd,
            onDelete: (id) => ExercisesScope.read(context).remove(id),
            onToggleFavorite: (id) =>
                ExercisesScope.read(context).toggleFavorite(id),
            onOpenDetail: _openDetailById,
            filtersExpanded: _filtersExpanded,
            onToggleFilters: () =>
                setState(() => _filtersExpanded = !_filtersExpanded),
            onOpenFavorites: _openFavorites,
            onOpenAbout: _openAbout,
            onOpenGallery: _openGallery,
          ),

          // Мини-бейдж по центру сверху. Не перехватывает клики.
          IgnorePointer(
            ignoring: true,
            child: SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: const ScopeTinyBadge(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- helpers ---------------------------------------------------------------

extension SetToggleExt<T> on Set<T> {
  void toggle(T value) {
    if (contains(value)) {
      remove(value);
    } else {
      add(value);
    }
  }
}
