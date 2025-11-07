import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/exercise.dart';

class AddExerciseScreen extends StatefulWidget {
  final void Function({
  required String title,
  required String description,
  required MuscleGroup muscle,
  required Equipment equipment,
  required Difficulty difficulty,
  }) onSave;

  const AddExerciseScreen({super.key, required this.onSave});

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
    widget.onSave(
      title: _title.text.trim(),
      description: _desc.text.trim(),
      muscle: _muscle,
      equipment: _equip,
      difficulty: _diff,
    );
    // ВАЖНО: здесь pop НЕ делаем — контейнер выполнит pushReplacement('/')
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: const Text('Добавить упражнение'),
        actions: [
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.check),
            tooltip: 'Сохранить',
          )
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
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Введите название' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _desc,
              decoration: const InputDecoration(
                labelText: 'Описание',
                border: OutlineInputBorder(),
              ),
              minLines: 3,
              maxLines: 6,
              validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Введите описание' : null,
            ),
            const SizedBox(height: 12),
            _Dropdown<MuscleGroup>(
              label: 'Группа мышц',
              value: _muscle,
              items: MuscleGroup.values
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(_muscleName(e)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _muscle = v ?? _muscle),
            ),
            const SizedBox(height: 12),
            _Dropdown<Equipment>(
              label: 'Оборудование',
              value: _equip,
              items: Equipment.values
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(_equipName(e)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _equip = v ?? _equip),
            ),
            const SizedBox(height: 12),
            _Dropdown<Difficulty>(
              label: 'Сложность',
              value: _diff,
              items: Difficulty.values
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(_diffName(e)),
              ))
                  .toList(),
              onChanged: (v) => setState(() => _diff = v ?? _diff),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.save),
              label: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dropdown<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const _Dropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isExpanded: true,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

String _muscleName(MuscleGroup g) => switch (g) {
  MuscleGroup.chest => 'Грудь',
  MuscleGroup.back => 'Спина',
  MuscleGroup.legs => 'Ноги',
  MuscleGroup.shoulders => 'Плечи',
  MuscleGroup.arms => 'Руки',
  MuscleGroup.core => 'Кор',
  MuscleGroup.fullBody => 'Все тело',
};

String _equipName(Equipment e) => switch (e) {
  Equipment.bodyweight => 'Собственный вес',
  Equipment.dumbbell => 'Гантели',
  Equipment.barbell => 'Штанга',
  Equipment.kettlebell => 'Гиря',
  Equipment.machine => 'Тренажёр',
  Equipment.band => 'Эспандер',
};

String _diffName(Difficulty d) => switch (d) {
  Difficulty.beginner => 'Начальный',
  Difficulty.intermediate => 'Средний',
  Difficulty.advanced => 'Продвинутый',
};
