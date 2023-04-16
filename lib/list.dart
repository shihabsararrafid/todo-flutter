import 'package:flutter/material.dart';

class taskList extends StatefulWidget {
  List<Object> task = [];
  // taskList({this.task})

  @override
  State<taskList> createState() => _taskListState();
}

class _taskListState extends State<taskList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
          width: 400,
          height: 150,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Hello Bd",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text("It's rafid")
                ],
              ),
            ),
          )),
    );
  }
}
