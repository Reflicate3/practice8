import 'package:flutter/material.dart';
import '../models/exercise.dart';

class DifficultyChips extends StatelessWidget {
  final Set<Difficulty> selected;
  final ValueChanged<Difficulty> onToggle;

  const DifficultyChips({
    super.key,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: Difficulty.values.map((d) {
        final isSelected = selected.contains(d);
        return FilterChip(
          key: ValueKey('diff_$d'),
          label: Text(difficultyLabel(d)),
          selected: isSelected,
          onSelected: (_) => onToggle(d),
        );
      }).toList(),
    );
  }
}
