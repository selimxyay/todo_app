import 'package:flutter/material.dart';

import '../widgets/todo_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(backgroundColor: theme.primaryContainer, title: const Text('TO DO APP')),
      body: ListView(
        children: [
          ToDoContainer(
            taskName: 'Do Homework',
            onChanged: (newValue) => '',
            value: false,
          ),
          ToDoContainer(
            taskName: 'Exercise',
            onChanged: (newValue) => '',
            value: false,
          ),
        ],
      ),
    );
  }
}