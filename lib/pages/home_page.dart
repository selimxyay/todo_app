import 'package:flutter/material.dart';

import '../widgets/todo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  /// list that stores all the todos.  
  List<List> todoList = [
    ['Do Homework', false],
    ['Buy Food', false],
  ];

  /// method that updates the value of checkbox which allow users to toggle. 
  /// in the context of programming, toggle basically means switching between two states, like true or false.
  /// 
  
  void onCheckBoxValueChanged({required bool? value, required int index}) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(backgroundColor: theme.primaryContainer, title: const Text('TO DO APP')),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, builderIndex) {
          return ToDoContainer(
            taskName: todoList[builderIndex][0], 
            value: todoList[builderIndex][1], 
            onChanged: (newValue) => onCheckBoxValueChanged(index: builderIndex, value: newValue),
          );
        },
      ),
    );
  }
}