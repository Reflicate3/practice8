import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../models/exercise.dart';
import '../data/exercises_repository.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _desc = TextEditingController();

  MuscleGroup _muscle = MuscleGroup.chest;
  Equipment _equip = Equipment.bodyweight;
  Difficulty _diff = Difficulty.beginner;

  @override
  void dispose() {
    _title.dispose();
    _desc.dispose();
    super.dispose();
  }

  void _save() {
    if (_formKey.currentState?.validate() != true) return;
    GetIt.I<ExercisesRepository>().add(
      title: _title.text.trim(),
      description: _desc.text.trim(),
      muscle: _muscle,
      equipment: _equip,
      difficulty: _diff,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        title: const Text('Добавить упражнение'),
        actions: [
          IconButton(
            onPressed: _save,
            tooltip: 'Сохранить',
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _title,
              decoration: const InputDecoration(
                labelText: 'Название',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Введите название' : null,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<MuscleGroup>(
              value: _muscle,
              decoration: const InputDecoration(
                labelText: 'Группа мышц',
                border: OutlineInputBorder(),
              ),
              items: MuscleGroup.values
                  .map((m) => DropdownMenuItem(
                value: m,
                child: Text(muscleLabel(m)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _muscle = v ?? _muscle),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<Equipment>(
              value: _equip,
              decoration: const InputDecoration(
                labelText: 'Оборудование',
                border: OutlineInputBorder(),
              ),
              items: Equipment.values
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(equipmentLabel(e)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _equip = v ?? _equip),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<Difficulty>(
              value: _diff,
              decoration: const InputDecoration(
                labelText: 'Сложность',
                border: OutlineInputBorder(),
              ),
              items: Difficulty.values
                  .map((d) => DropdownMenuItem(
                value: d,
                child: Text(difficultyLabel(d)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _diff = v ?? _diff),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _desc,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Описание',
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Добавьте описание'
                  : null,
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.check),
              label: const Text('Сохранить'),
            ),
            const SizedBox(height: 8),
            Text(
              'Сохранение выполняется через GetIt → ExercisesRepository.add().',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
