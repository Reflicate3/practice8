import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'features/exercises/data/exercises_repository.dart';
import 'app.dart';

final getIt = GetIt.I;

void setupDI() {
  // Единый экземпляр репозитория на всё приложение
  getIt.registerSingleton<ExercisesRepository>(ExercisesRepository());
  // Альтернатива при желании:
  // getIt.registerLazySingleton<ExercisesRepository>(() => ExercisesRepository());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  runApp(const MyApp());
}
