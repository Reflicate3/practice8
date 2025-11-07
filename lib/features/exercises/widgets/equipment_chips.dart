import 'package:flutter/material.dart';
import '../models/exercise.dart';

class EquipmentChips extends StatelessWidget {
  final Set<Equipment> selected;
  final ValueChanged<Equipment> onToggle;

  const EquipmentChips({
    super.key,
    required this.selected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: Equipment.values.map((e) {
        final isSelected = selected.contains(e);
        return FilterChip(
          key: ValueKey('eq_$e'),
          label: Text(equipmentLabel(e)),
          selected: isSelected,
          onSelected: (_) => onToggle(e),
        );
      }).toList(),
    );
  }
}
