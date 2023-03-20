import 'package:flutter/material.dart';

class TaskTitle extends  StatefulWidget {


  @override
  _TaskTitleState createState() => _TaskTitleState();

}

class _TaskTitleState extends State<TaskTitle> {


  bool isChecked = false;

  void checkboxCallBack(bool? checkboxState) {
    setState(() {
      isChecked = checkboxState ?? true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null
        ),
      ),
      trailing: TaskCheckbox(isChecked, checkboxCallBack),
    );
  }
}


class TaskCheckbox extends StatelessWidget {


  final bool checkBoxState;
  final Function(bool?) toggleCheckboxState;

  TaskCheckbox(this.checkBoxState, this.toggleCheckboxState);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      onChanged: toggleCheckboxState,
    );
  }
}




