import 'package:flutter/material.dart';

class TaskTitle extends  StatelessWidget {



  final bool isChecked;
  final String taskTitle;

  TaskTitle({this.isChecked = false, required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: (value) {

        },
        // onChanged: toggleCheckboxState,
      )
    );
  }
}

// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? true;
// });
// }



