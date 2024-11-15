import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToDoContainer extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  void Function(bool?)? onChanged;
  void Function()? onDelete;
  
  ToDoContainer({
    super.key, 
    required this.isTaskCompleted, 
    required this.taskName, 
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Center(
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
        decoration: BoxDecoration(
          color: theme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Checkbox(
              activeColor: Colors.black,
              value: isTaskCompleted, 
              onChanged: onChanged,
            ),
            Text(
              taskName,
              /// if taskCompleted is true, which means if the task is completed
              /// the text name will have a decoration of line through
              /// if not, there won't be any decoration
              style: TextStyle(decoration: isTaskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
            ),
            const Spacer(),
            IconButton(
              color: Colors.redAccent.shade700,
              onPressed: onDelete, 
              icon: const Icon(Icons.delete)
            ),
          ],
        ),
      ),
    );
  }
}