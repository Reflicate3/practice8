import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/exercise.dart';
import '../widgets/exercise_card.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Exercise> items;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<String> onOpenDetail;

  const FavoritesScreen({
    super.key,
    required this.items,
    required this.onDelete,
    required this.onToggleFavorite,
    required this.onOpenDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: const Text('Избранные упражнения'),
      ),
      body: items.isEmpty
          ? const _EmptyFavs()
          : _List(
        items: items,
        onDelete: onDelete,
        onToggleFavorite: onToggleFavorite,
        onOpenDetail: onOpenDetail,
      ),
    );
  }
}

class _List extends StatelessWidget {
  final List<Exercise> items;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<String> onOpenDetail;

  const _List({
    required this.items,
    required this.onDelete,
    required this.onToggleFavorite,
    required this.onOpenDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, i) {
        final item = items[i];
        return Dismissible(
          key: ValueKey('fav_${item.id}'),
          background: Container(
            color: Theme.of(context).colorScheme.errorContainer,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(Icons.delete),
          ),
          secondaryBackground: Container(
            color: Theme.of(context).colorScheme.errorContainer,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Icon(Icons.delete),
          ),
          onDismissed: (_) => onDelete(item.id),
          child: ExerciseCard(
            item: item,
            onTap: () => onOpenDetail(item.id),
            onToggleFavorite: () => onToggleFavorite(item.id),
          ),
        );
      },
      separatorBuilder: (_, __) => const SizedBox(height: 4),
      itemCount: items.length,
    );
  }
}

class _EmptyFavs extends StatelessWidget {
  const _EmptyFavs();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.favorite_border, size: 56),
            const SizedBox(height: 8),
            Text('Пока пусто',
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            const Text('Добавьте упражнения в избранное со списка.'),
          ],
        ),
      ),
    );
  }
}
