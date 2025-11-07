import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'features/exercises/screens/exercises_container.dart';
import 'features/exercises/screens/about_screen.dart';
import 'features/exercises/screens/gallery_screen.dart';
import 'features/exercises/screens/favorites_screen.dart';
import 'features/exercises/screens/exercise_detail_screen.dart';
import 'features/exercises/screens/add_exercise_screen.dart';

import 'features/exercises/navigation_args.dart';
import 'features/exercises/models/exercise.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        final extra = state.extra;
        final List<Exercise>? initial =
        extra is List<Exercise> ? extra : null;
        return ExercisesContainer(initial: initial);
      },
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/gallery',
      name: 'gallery',
      builder: (context, state) {
        final args = state.extra is GalleryArgs
            ? state.extra as GalleryArgs
            : const GalleryArgs();
        return GalleryScreen(hideBack: args.hideBack);
      },
    ),
    GoRoute(
      path: '/favorites',
      name: 'favorites',
      builder: (context, state) {
        final args = state.extra as FavoritesArgs;
        return FavoritesScreen(
          items: args.items,
          onDelete: args.onDelete,
          onToggleFavorite: args.onToggleFavorite,
          onOpenDetail: args.onOpenDetail,
        );
      },
    ),
    GoRoute(
      path: '/detail/:id',
      name: 'detail',
      builder: (context, state) {
        final args = state.extra as ExerciseDetailArgs;
        return ExerciseDetailScreen(
          item: args.item,
          onToggleFavorite: args.onToggleFavorite,
        );
      },
    ),
    GoRoute(
      path: '/add',
      name: 'add',
      builder: (context, state) {
        final args = state.extra as AddExerciseArgs;
        return AddExerciseScreen(onSave: args.onSave);
      },
    ),
  ],
);
