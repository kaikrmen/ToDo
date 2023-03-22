import 'package:flutter/cupertino.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Walk the dog'),
    Task(name: 'Learn Flutter')
  ];


  int get taskCount {
    return tasks.length;
  }
}