import 'package:flutter/material.dart';

// String? newTaskTitle;


class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({this.onChanged, this.onTap});
  final onChanged;
  final onTap;

  dynamic newTaskTitle = '';

  @override
  Widget build(BuildContext context) {

    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: onChanged
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: onTap,
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}