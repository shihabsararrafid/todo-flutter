import 'package:flutter/material.dart';

class tasklist extends StatelessWidget {
  dynamic taskName;
  dynamic description;
  dynamic category;
  tasklist({this.taskName, this.description, this.category});

  @override
  Widget build(BuildContext context) {
    Color taskColor = Colors.blue.shade600;
    var taskTag = category;
    if (taskTag == 'Work') {
      taskColor = Colors.deepPurple;
    } else if (taskTag == 'School') {
      taskColor = Colors.green;
    }
    return Card(
      child: SizedBox(
          width: 400,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // border: Border.all(),
                      shape: BoxShape.circle,
                      color: taskColor,
                    ),
                    child: SizedBox(
                      height: 10,
                      width: 10,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      Text(
                        taskName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(description)
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
