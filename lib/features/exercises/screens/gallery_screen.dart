import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key, this.hideBack = false});

  final bool hideBack;

  static const String _category = 'sport';
  static const String _size = '200x200';
  static const List<int> _ids = [125, 207, 318, 451, 509];

  static List<String> get _photos =>
      _ids.map((id) => 'https://static.photos/$_category/$_size/$id').toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: hideBack ? null : BackButton(onPressed: () => context.pop()),
        title: const Text('Галерея'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12,
        ),
        itemCount: _photos.length,
        itemBuilder: (context, i) => ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            _photos[i],
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) => Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              child: const Center(child: Icon(Icons.broken_image)),
            ),
          ),
        ),
      ),
    );
  }
}
