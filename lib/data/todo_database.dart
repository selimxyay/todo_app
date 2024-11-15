import 'package:hive/hive.dart';

mixin class TodoDatabase {
  final todoBox = Hive.box('todo');

  List todoList = [];

  // if user is opening the app for the first time ever, this method will be executed.
  void initialData() {
    todoList = [
      ["Todo 1", false],
      ["Todo 2", false],
    ];
  }

  // load the data from database
  void loadData() {
    todoList = todoBox.get('todoList');
  }

  // update the data
  void updateData() {
    todoBox.put('todoList', todoList);
  }
  
}