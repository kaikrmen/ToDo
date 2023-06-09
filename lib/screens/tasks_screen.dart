import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';
import '../models/task.dart';
import 'add_task_screen.dart';

import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});


  @override
  Widget build(BuildContext context) {


    String newTask = '';

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(onPressed: () {
        // slide up botton sheet
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) =>
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(
                    onChanged: (value) {
                      newTask = value;
                    },
                    onTap: () {
                      Provider.of<TaskData>(context, listen: false).addNewTask(newTask);
                      Navigator.pop(context);
                    },
                  ),
                )
              ),
        );
      }, backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
              const EdgeInsets.only(
                  top: 45.0,
                  left: 30.0,
                  right: 30.0,
                  bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                      'To-do',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.0,
                          fontWeight: FontWeight.w400
                      ),
                  ),
                  Text('${Provider.of<TaskData>(context).taskCount} tasks',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: TasksList(),
              ),
            )
          ]),
    );
  }
}