import 'package:flutter/material.dart';
import '../models/exercise.dart';

class MuscleChips extends StatelessWidget {
  final MuscleGroup? selected;
  final ValueChanged<MuscleGroup?> onChanged;

  const MuscleChips({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final values = [null, ...MuscleGroup.values];
    return Wrap(
      spacing: 8,
      children: values.map((m) {
        final isSelected = m == selected;
        return ChoiceChip(
          key: ValueKey('musc_${m?.name ?? 'all'}'),
          label: Text(m == null ? 'Все группы' : muscleLabel(m)),
          selected: isSelected,
          onSelected: (_) => onChanged(m),
        );
      }).toList(),
    );
  }
}
