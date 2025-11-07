import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/exercise.dart';
import '../data/exercises_repository.dart';

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

  List<Exercise> _visibleFromRepo() {
    final repo = GetIt.I<ExercisesRepository>(); // доступ без context
    final q = _q;
    return repo.all.where((e) {
      final byQuery = q.isEmpty ||
          e.title.toLowerCase().contains(q) ||
          e.description.toLowerCase().contains(q);
      final byDiff = _diff.isEmpty || _diff.contains(e.difficulty);
      final byEquip = _equip.isEmpty || _equip.contains(e.equipment);
      final byMuscle = _muscle == null || _muscle == e.muscle;
      return byQuery && byDiff && byEquip && byMuscle;
    }).toList();
  }

  void _openDetailById(String id) {
    final repo = GetIt.I<ExercisesRepository>();
    final ex = repo.byId(id);
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
    final repo = GetIt.I<ExercisesRepository>();
    return Scaffold(
      body: AnimatedBuilder(
        animation: repo, // пересобираем при notifyListeners()
        builder: (context, _) {
          final items = _visibleFromRepo(); // <- берем напрямую из GetIt
          return Stack(
            children: [
              ExercisesListScreen(
                items: items,
                query: _q,
                selectedDifficulties: _diff,
                selectedEquipment: _equip,
                selectedMuscle: _muscle,

                onSearch: (q) => setState(() => _q = q.trim().toLowerCase()),
                onToggleDifficulty: (d) => setState(() => _diff.toggle(d)),
                onToggleEquipment: (e) => setState(() => _equip.toggle(e)),
                onSelectMuscle: (m) => setState(() => _muscle = m),

                onAddTap: _openAdd,
                onDelete: (id) => GetIt.I<ExercisesRepository>().remove(id),
                onToggleFavorite: (id) => GetIt.I<ExercisesRepository>().toggleFavorite(id),
                onOpenDetail: _openDetailById,

                filtersExpanded: _filtersExpanded,
                onToggleFilters: () => setState(() => _filtersExpanded = !_filtersExpanded),

                onOpenFavorites: _openFavorites,
                onOpenAbout: _openAbout,
                onOpenGallery: _openGallery,
              ),

              // Мини-бейдж по центру сверху (не перехватывает клики)
              const IgnorePointer(
                ignoring: true,
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: ScopeTinyBadge(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
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
