import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise item;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const ExerciseCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final String leadingLetter =
    (item.title.isNotEmpty ? item.title[0] : '?').toUpperCase();

    return ListTile(
      key: ValueKey(item.id),
      leading: CircleAvatar(child: Text(leadingLetter)),
      title: Text(item.title),
      subtitle: Wrap(
        spacing: 8,
        runSpacing: -8,
        children: [
          _Chip(label: muscleLabel(item.muscle), icon: Icons.fitness_center),
          _Chip(label: equipmentLabel(item.equipment), icon: Icons.handyman),
          _Chip(label: difficultyLabel(item.difficulty), icon: Icons.trending_up),
        ],
      ),
      trailing: IconButton(
        tooltip: item.isFavorite ? 'Убрать из избранного' : 'В избранное',
        icon: Icon(item.isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: onToggleFavorite,
      ),
      onTap: onTap,
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final IconData icon;
  const _Chip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label), avatar: Icon(icon, size: 16));
  }
}
