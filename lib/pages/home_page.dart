import 'package:flutter/material.dart';
import 'package:todo_app/logic/home_page_logic.dart';
import 'package:todo_app/widgets/todo_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageLogic {
  @override
  void initState() {
    super.initState();
    todo.get('todoList') == null 
    ? db.initialData()
    : db.loadData();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: theme.primaryContainer,
        title: const Text('TO DO APP'),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, builderIndex) {
          return ToDoContainer(
            taskName: db.todoList[builderIndex][0],
            isTaskCompleted: db.todoList[builderIndex][1],
            onChanged: (newValue) => onCheckBoxValueChanged(index: builderIndex, value: newValue),
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
