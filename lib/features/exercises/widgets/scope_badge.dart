import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../data/exercises_repository.dart';

/// Компактный счётчик (реактивный): подписка на репозиторий через AnimatedBuilder.
class ScopeTinyBadge extends StatelessWidget {
  const ScopeTinyBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<ExercisesRepository>();
    return AnimatedBuilder(
      animation: repo,
      builder: (context, _) {
        final total = repo.all.length;
        final fav = repo.all.where((e) => e.isFavorite).length;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            'Всего: $total • Избранные: $fav',
            style: const TextStyle(fontSize: 11, color: Colors.white, height: 1.0),
          ),
        );
      },
    );
  }
}

/// Живой крупный бейдж (если вдруг используешь его где-то ещё).
class ScopeLiveBadge extends StatelessWidget {
  const ScopeLiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<ExercisesRepository>();
    return AnimatedBuilder(
      animation: repo,
      builder: (context, _) {
        final total = repo.all.length;
        final fav = repo.all.where((e) => e.isFavorite).length;
        return _Badge(
          title: 'GetIt + AnimatedBuilder — ЖИВАЯ',
          total: total,
          fav: fav,
          color: Colors.green,
        );
      },
    );
  }
}

/// "Замороженный" бейдж — без подписки (для демонстрации разницы).
class ScopeStaleBadge extends StatelessWidget {
  const ScopeStaleBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = GetIt.I<ExercisesRepository>();
    final total = repo.all.length;
    final fav = repo.all.where((e) => e.isFavorite).length;

    return _Badge(
      title: 'GetIt — БЕЗ ПОДПИСКИ',
      total: total,
      fav: fav,
      color: Colors.grey,
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.title,
    required this.total,
    required this.fav,
    required this.color,
  });

  final String title;
  final int total;
  final int fav;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: DefaultTextStyle(
          style: Theme.of(context).textTheme.labelMedium!,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Text(title),
              const SizedBox(width: 12),
              Text('Всего: $total'),
              const SizedBox(width: 8),
              Text('Избранных: $fav'),
            ],
          ),
        ),
      ),
    );
  }
}
