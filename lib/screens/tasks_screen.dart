import 'package:flutter/material.dart';
import 'add_task_screen.dart';
import 'package:todoey/models/task.dart';

import '../widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Walk the dog'),
    Task(name: 'Learn Flutter')
  ];

  @override
  Widget build(BuildContext context) {

    String newTask = '';

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(onPressed: () {
        // slide up botton sheet
        showModalBottomSheet(
          context: context,
          builder: (context) =>
              AddTaskScreen(
                onChanged: (value) {
                  newTask = value;
                },
                onTap: () {
                  setState(() {
                    tasks.add(Task(name: newTask));
                    Navigator.pop(context);
                  });
                },
                  ),
        );
      }, backgroundColor: Colors.lightBlueAccent, child: Icon(Icons.add),),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding:
              EdgeInsets.only(top: 45.0, left: 30.0, right: 30.0, bottom: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(child: Icon(Icons.list, size: 30.0, color: Colors.lightBlueAccent),
                    backgroundColor: Colors.white,
                    radius: 30.0,
                  ),
                  SizedBox(height: 10.0),
                  Text('Todoey', style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.w400)),
                  Text('${tasks.length} tasks',
                      style: TextStyle(color: Colors.white, fontSize: 18.0))
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: TasksList(tasks),
              ),
            )
          ]),
    );
  }
}