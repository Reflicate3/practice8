import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'features/exercises/screens/exercises_container.dart';
import 'features/exercises/screens/about_screen.dart';
import 'features/exercises/screens/gallery_screen.dart';
import 'features/exercises/screens/add_exercise_screen.dart';
import 'features/exercises/screens/favorites_screen.dart';
import 'features/exercises/screens/exercise_detail_screen.dart';
import 'features/exercises/data/exercises_repository.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const ExercisesContainer(),
        routes: [
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (context, state) => const AboutScreen(),
          ),
          GoRoute(
            path: 'gallery',
            name: 'gallery',
            builder: (context, state) => const GalleryScreen(),
          ),
          GoRoute(
            path: 'favorites',
            name: 'favorites',
            builder: (context, state) => const FavoritesScreen(),
          ),
          GoRoute(
            path: 'add',
            name: 'add',
            builder: (context, state) => const AddExerciseScreen(),
          ),
          GoRoute(
            path: 'detail/:id',
            name: 'detail',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              final repo = GetIt.I<ExercisesRepository>();
              final item = repo.byId(id);
              if (item == null) {
                return const Scaffold(
                  body: Center(child: Text('Упражнение не найдено')),
                );
              }
              return ExerciseDetailScreen(item: item);
            },
          ),
        ],
      ),
    ],
  );
}
