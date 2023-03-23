import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'task.dart';


class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Walk the dog'),
    Task(name: 'Learn Flutter')
  ];


  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }


  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTask) {
    final task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }


}