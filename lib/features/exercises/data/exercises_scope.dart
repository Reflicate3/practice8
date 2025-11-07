import 'package:flutter/widgets.dart';
import 'exercises_repository.dart';

class ExercisesScope extends InheritedNotifier<ExercisesRepository> {
  const ExercisesScope({
    super.key,
    required ExercisesRepository repository,
    required super.child,
  }) : super(notifier: repository);

  // С подпиской (widget пересоберётся при notifyListeners)
  static ExercisesRepository of(BuildContext context) {
    final scope =
    context.dependOnInheritedWidgetOfExactType<ExercisesScope>();
    assert(scope != null, 'ExercisesScope not found in widget tree');
    return scope!.notifier!;
  }

  // Без подписки (в обработчиках)
  static ExercisesRepository read(BuildContext context) {
    final element =
    context.getElementForInheritedWidgetOfExactType<ExercisesScope>();
    final scope = element?.widget as ExercisesScope?;
    assert(scope != null, 'ExercisesScope not found in widget tree');
    return scope!.notifier!;
  }
}
