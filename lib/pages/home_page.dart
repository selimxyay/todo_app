import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/widgets/create_new_task_dialog.dart';

import '../widgets/todo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todo = Hive.box('todo');
  final createNewTaskInputController = TextEditingController();

  /// list that stores all the todos.  
  List<List> todoList = [
    ['Do Homework', false],
    ['Buy Food', false],
  ];

  /// method that updates the value of checkbox which allow users to toggle. 
  /// in the context of programming, toggle basically means switching between two states, like true or false.
  void onCheckBoxValueChanged({required bool? value, required int index}) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
 
  /// when users clicked on floating action button for creating a new task
  /// this method will be executed.
  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return CreateNewTaskDialog(
          controller: createNewTaskInputController,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  /// when users clicked on save, this method will be executed and a new task will be added to the list. 
  void saveNewTask() {
    setState(() {
      todoList.add([
        createNewTaskInputController.text,
        false,
      ]);
    }); 
    createNewTaskInputController.clear();
    Navigator.of(context).pop();
  }

  // edit task
  void editTask() {}

  // delete task
  void deleteTask({required int index}) {
    setState(() {
      todoList.removeAt(index);
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
            isTaskCompleted: todoList[builderIndex][1], 
            onChanged: (newValue) => onCheckBoxValueChanged(index: builderIndex, value: newValue),
            onEdit: editTask,
            onDelete: () => deleteTask(index: builderIndex),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}