import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/exercise.dart';
import '../data/exercises_seed.dart';

import 'exercises_list_screen.dart';
import 'exercise_detail_screen.dart';
import 'favorites_screen.dart';
import 'about_screen.dart';
import 'gallery_screen.dart';
import 'add_exercise_screen.dart';
import '/features/exercises/navigation_args.dart';

class ExercisesContainer extends StatefulWidget {

  final List<Exercise>? initial;

  const ExercisesContainer({super.key, this.initial});

  @override
  State<ExercisesContainer> createState() => _ExercisesContainerState();
}

class _ExercisesContainerState extends State<ExercisesContainer> {
  late List<Exercise> _all;

  String _query = '';
  final Set<Difficulty> _diff = {};
  final Set<Equipment> _equip = {};
  MuscleGroup? _muscle;

  // UI
  bool _filtersExpanded = true;

  @override
  void initState() {
    super.initState();
    _all = List<Exercise>.from(widget.initial ?? seedExercises);
  }

  String get _q => _query.trim().toLowerCase();

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
    final ex = _all.firstWhere((e) => e.id == id);
    context.push(
      '/detail/$id',
      extra: ExerciseDetailArgs(
        item: ex,
        onToggleFavorite: () => _toggleFavoriteById(ex.id),
      ),
    );
  }

  void _openAdd() {
    context.push(
      '/add',
      extra: AddExerciseArgs(
        onSave: ({
          required String title,
          required String description,
          required MuscleGroup muscle,
          required Equipment equipment,
          required Difficulty difficulty,
        }) {
          final updated = List<Exercise>.from(_all)
            ..add(
              Exercise(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                title: title,
                description: description,
                muscle: muscle,
                equipment: equipment,
                difficulty: difficulty,
                isFavorite: false,
                createdAt: DateTime.now(),
              ),
            );

          context.pushReplacement('/', extra: updated);
        },
      ),
    );
  }

  void _openFavorites() {
    final favs = _all.where((e) => e.isFavorite).toList();
    context.push(
      '/favorites',
      extra: FavoritesArgs(
        items: favs,
        onDelete: (id) => setState(() => _all.removeWhere((e) => e.id == id)),
        onToggleFavorite: _toggleFavoriteById,
        onOpenDetail: _openDetailById,
      ),
    );
  }
  void _openAbout() => context.push('/about');

  void _openGallery() => context.push('/gallery');

  void _toggleFavoriteById(String id) {
    final i = _all.indexWhere((e) => e.id == id);
    if (i != -1) {
      setState(() {
        _all[i] = _all[i].copyWith(isFavorite: !_all[i].isFavorite);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExercisesListScreen(
        items: _visible,
        query: _query,
        selectedDifficulties: _diff,
        selectedEquipment: _equip,
        selectedMuscle: _muscle,
        onSearch: (v) => setState(() => _query = v),
        onToggleDifficulty: (d) => setState(() => _diff.toggle(d)),
        onToggleEquipment: (e) => setState(() => _equip.toggle(e)),
        onSelectMuscle: (m) => setState(() => _muscle = m),

        onAddTap: _openAdd,
        onDelete: (id) => setState(() => _all.removeWhere((e) => e.id == id)),
        onToggleFavorite: _toggleFavoriteById,
        onOpenDetail: _openDetailById,

        filtersExpanded: _filtersExpanded,
        onToggleFilters: () => setState(() => _filtersExpanded = !_filtersExpanded),

        onOpenFavorites: _openFavorites, // push (вертикально)
        onOpenAbout: _openAbout,         // push (вертикально)
        onOpenGallery: _openGallery,     // push (вертикально)
      ),
    );
  }
}

extension _ToggleSet<T> on Set<T> {
  void toggle(T v) => contains(v) ? remove(v) : add(v);
}
