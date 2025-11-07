import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/exercise_card.dart';
import '../data/exercises_scope.dart';
import 'exercise_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = ExercisesScope.of(context);
    final items = repo.all.where((e) => e.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранные упражнения'),
      ),
      body: items.isEmpty
          ? const _EmptyFavs()
          : ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final ex = items[index];
          return Dismissible(
            key: ValueKey('fav_${ex.id}'),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => ExercisesScope.read(context).remove(ex.id),
            child: ExerciseCard(
              item: ex,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ExerciseDetailScreen(item: ex),
                ),
              ),
              onToggleFavorite: () =>
                  ExercisesScope.read(context).toggleFavorite(ex.id),
            ),
          );
        },
      ),
    );
  }
}

class _EmptyFavs extends StatelessWidget {
  const _EmptyFavs();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text('Пока пусто. Отмечайте упражнения сердечком.'),
      ),
    );
  }
}
