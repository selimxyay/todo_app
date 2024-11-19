import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/todo_database.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:todo_app/widgets/create_new_task_dialog.dart';

mixin HomePageLogic on State<HomePage> {
  final box = Hive.box('todo');
  final db = TodoDatabase();
  final task = TextEditingController();

  void onCheckBoxValueChanged({
    required bool? value,
    required int index,
  }) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
      db.updateData();
    });
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return CreateNewTaskDialog(
          controller: task,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveTask,
        );
      },
    );
  }

  void saveTask() {
    setState(() {
      db.todoList.add([
        task.text,
        false,
      ]);
    });
    task.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask({required int index}) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }
}
