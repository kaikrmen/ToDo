import 'package:flutter/material.dart';

class TaskTitle extends  StatelessWidget {



  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallback;
  final GestureLongPressCallback? onLongPress;



  TaskTitle({this.isChecked = false, required this.taskTitle, required this.checkboxCallback, this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ) 
    );
  }
}

// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? true;
// });
// }



