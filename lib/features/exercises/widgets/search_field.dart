import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final String hint;

  const SearchField({
    super.key,
    required this.value,
    required this.onChanged,
    this.hint = 'Поиск упражнений…',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const ValueKey('search_field'),
      controller: TextEditingController(text: value)
        ..selection = TextSelection.collapsed(offset: value.length),
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: hint,
        isDense: true,
      ),
    );
  }
}
