import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/task_tittle.dart';


class TasksList extends StatefulWidget {


  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return Dismissible(
            key: Key(task.name),
            onDismissed: (direction) {
              setState(() {
                Provider.of<TaskData>(context, listen: false).deleteTask(task);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.grey[400],
                    content: Text(
                      "${task.name} deleted",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                );
              });
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: AlignmentDirectional.centerStart,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: TaskTitle(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (bool? checkboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                // onLongPress: () {
                //   taskData.deleteTask(task);
                // },
              ),
          );
          }, itemCount: taskData.taskCount,
        );
      },

    );
  }
}
