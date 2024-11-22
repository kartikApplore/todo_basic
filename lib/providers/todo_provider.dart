import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<Task> _todos = [];

  List<Task> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Task(title: title));
    notifyListeners();
  }

  void updateCompletionStatus(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }
}
