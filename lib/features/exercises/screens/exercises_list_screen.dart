import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../widgets/difficulty_chips.dart';
import '../widgets/equipment_chips.dart';
import '../widgets/muscle_chips.dart';
import '../widgets/exercise_card.dart';
import '../widgets/search_field.dart';
import 'package:go_router/go_router.dart';

class ExercisesListScreen extends StatelessWidget {
  final List<Exercise> items;
  final String query;
  final Set<Difficulty> selectedDifficulties;
  final Set<Equipment> selectedEquipment;
  final MuscleGroup? selectedMuscle;

  final ValueChanged<String> onSearch;
  final ValueChanged<Difficulty> onToggleDifficulty;
  final ValueChanged<Equipment> onToggleEquipment;
  final ValueChanged<MuscleGroup?> onSelectMuscle;

  final VoidCallback onAddTap;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onToggleFavorite;
  final ValueChanged<String> onOpenDetail;

  final bool filtersExpanded;
  final VoidCallback onToggleFilters;
  final VoidCallback onOpenFavorites;
  final VoidCallback onOpenAbout;

  final VoidCallback onOpenGallery;

  const ExercisesListScreen({
    super.key,
    required this.items,
    required this.query,
    required this.selectedDifficulties,
    required this.selectedEquipment,
    required this.selectedMuscle,
    required this.onSearch,
    required this.onToggleDifficulty,
    required this.onToggleEquipment,
    required this.onSelectMuscle,
    required this.onAddTap,
    required this.onDelete,
    required this.onToggleFavorite,
    required this.onOpenDetail,
    required this.filtersExpanded,
    required this.onToggleFilters,
    required this.onOpenFavorites,
    required this.onOpenAbout,
    required this.onOpenGallery,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справочник упражнений'),
        actions: [
          IconButton(
            tooltip: filtersExpanded ? 'Скрыть фильтры' : 'Показать фильтры',
            onPressed: onToggleFilters,
            icon: Icon(filtersExpanded ? Icons.expand_less : Icons.tune),
          ),
          IconButton(
            tooltip: 'Галерея',
            onPressed: onOpenGallery,
            icon: const Icon(Icons.photo_library),
          ),
          IconButton(
            tooltip: 'Избранное',
            onPressed: onOpenFavorites,
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            tooltip: 'О программе',
            onPressed: onOpenAbout,
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onAddTap,
        icon: const Icon(Icons.add),
        label: const Text('Добавить'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(value: query, onChanged: onSearch),
            const SizedBox(height: 12),
            AnimatedCrossFade(
              crossFadeState: filtersExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 200),
              firstChild: _FiltersBlock(
                selectedMuscle: selectedMuscle,
                onSelectMuscle: onSelectMuscle,
                selectedDifficulties: selectedDifficulties,
                onToggleDifficulty: onToggleDifficulty,
                selectedEquipment: selectedEquipment,
                onToggleEquipment: onToggleEquipment,
              ),
              secondChild: const SizedBox.shrink(),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: items.isEmpty
                  ? const _EmptyStub()
                  : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final ex = items[index];
                  return Dismissible(
                    key: ValueKey('dismiss_${ex.id}'),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      child:
                      const Icon(Icons.delete, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16),
                      child:
                      const Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (_) => onDelete(ex.id),
                    child: ExerciseCard(
                      item: ex,
                      onToggleFavorite: () => onToggleFavorite(ex.id),
                      onTap: () => onOpenDetail(ex.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FiltersBlock extends StatelessWidget {
  final MuscleGroup? selectedMuscle;
  final ValueChanged<MuscleGroup?> onSelectMuscle;
  final Set<Difficulty> selectedDifficulties;
  final ValueChanged<Difficulty> onToggleDifficulty;
  final Set<Equipment> selectedEquipment;
  final ValueChanged<Equipment> onToggleEquipment;

  const _FiltersBlock({
    required this.selectedMuscle,
    required this.onSelectMuscle,
    required this.selectedDifficulties,
    required this.onToggleDifficulty,
    required this.selectedEquipment,
    required this.onToggleEquipment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Группа мышц', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        MuscleChips(selected: selectedMuscle, onChanged: onSelectMuscle),
        const SizedBox(height: 12),
        Text('Сложность', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        DifficultyChips(
          selected: selectedDifficulties,
          onToggle: onToggleDifficulty,
        ),
        const SizedBox(height: 12),
        Text('Оборудование', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 6),
        EquipmentChips(
          selected: selectedEquipment,
          onToggle: onToggleEquipment,
        ),
      ],
    );
  }
}

class _EmptyStub extends StatelessWidget {
  const _EmptyStub();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_off, size: 48),
          const SizedBox(height: 8),
          Text('Ничего не найдено',
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          const Text('Измените строку поиска или фильтры.'),
        ],
      ),
    );
  }
}
