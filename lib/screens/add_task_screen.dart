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
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: onChanged
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: onTap,
              child: Text(
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