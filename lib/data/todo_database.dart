import 'package:hive/hive.dart';

mixin class TodoDatabase {
  final box = Hive.box('todo');

  List todoList = [];

  /// if user is opening the app for the first time ever, this method will be executed.
  /// we're manually adding some dummy todos in order to show users how the app works. 
  /// so there is no interaction with hive at this point. 
  void initialData() {
    todoList = [
      ["Todo 1", false],
      ["Todo 2", false],
    ];
  }

  /// this method gets the data stored inside the hive key called todos.
  void loadData() {
    todoList = box.get('todos');
  }

  /// at the end of every user interaction methods such as adding or deleting task, this method be executed.
  /// this method basically gives the new version of todoList into a hive key with the name of todos. 
  /// now this key stores the latest version of todoList.
  /// in this way, we can call this key and display the latest version of user's todo list.
  void updateData() {
    box.put('todos', todoList);
  }
}