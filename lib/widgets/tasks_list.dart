import 'package:flutter/cupertino.dart';
import 'package:todoey/widgets/task_tittle.dart';

import '../models/task.dart';


class TasksList extends StatefulWidget {


  final List<Task> tasks;

  TasksList(this.tasks);

  @override
  _TasksListState createState() => _TasksListState();
}


class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
        return TaskTitle(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (bool? checkboxState) {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          }
        );
    }, itemCount: widget.tasks.length,);
  }
}
