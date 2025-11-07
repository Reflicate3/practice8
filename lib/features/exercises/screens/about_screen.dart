import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../navigation_args.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => context.pop()),
        title: const Text('О программе'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Учебное приложение "Справочник упражнений".\n'
                  'Демонстрация маршрутизированной вертикальной (push/pop)\n'
                  'и горизонтальной (pushReplacement) навигации на GoRouter.\n'
                  'NavigationBar не используется.',
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                context.go('/gallery', extra: const GalleryArgs(hideBack: true));
              },
              icon: const Icon(Icons.open_in_new),
              label: const Text('Перейти в галерею (go)'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Кнопка выше выполняет context.go(...) — полный сброс стека.\n'
                  'На экране Галереи стрелки "Назад" не будет (hideBack: true).',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
