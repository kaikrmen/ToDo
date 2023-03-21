import 'package:flutter/cupertino.dart';
import 'package:todoey/widgets/task_tittle.dart';

import '../models/task.dart';


class TasksList extends StatefulWidget {

  @override
  _TasksListState createState() => _TasksListState();
}


class _TasksListState extends State<TasksList> {



  List<Task> tasks = [
    Task(name: 'Buy Milk')
  ];





  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
        return TaskTitle(
          taskTitle: tasks[index].name,
          isChecked: tasks[index].isDone,
          checkboxCallback: (bool? checkboxState) {
            setState(() {
              tasks[index].toggleDone();
            });
          }
        );
    }, itemCount: tasks.length,);
  }
}
