import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoContainer extends StatelessWidget {
  final String taskName;
  final bool value;
  void Function(bool?)? onChanged;
  
  ToDoContainer({
    super.key, 
    required this.value, 
    required this.taskName, 
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: theme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Checkbox(
            value: value, 
            onChanged: onChanged,
          ),
          Text(taskName),
        ],
      ),
    );
  }
}