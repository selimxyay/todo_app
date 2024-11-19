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
    /// so in here, if the key of todoList is equal to null, which means it doesn't exist,
    /// which means either user is opening the app for the first time or hasn't changed anything.
    /// so in this situation, initialData method will be executed.
    /// if the key is not null, so this means user actually used the app and made some changes.
    /// so in this condition, loadData method will be executed and it will get the todos key. 
    box.get('todoList') == null 
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
        itemBuilder: (context, index) {
          return ToDoContainer(
            taskName: db.todoList[index][0],
            isTaskCompleted: db.todoList[index][1],
            onChanged: (newValue) => onCheckBoxValueChanged(index: index, value: newValue),
            onDelete: () => deleteTask(index: index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
