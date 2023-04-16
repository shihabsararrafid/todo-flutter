import 'package:flutter/material.dart';
import 'list.dart';
import 'dialogbox.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[700],
          title: const Text(
            'Your daily todo list',
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Icon(Icons.menu),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                  onTap: () {
                    print('CLicked');
                  },
                  child: Icon(Icons.calendar_month)),
            )
          ],
        ),
        body: todoList(),

        // Move your code to a separate widget
      ),
    );
  }
}

class todoList extends StatefulWidget {
  const todoList({super.key});

  @override
  State<todoList> createState() => _todoListState();
}

class allTasks {
  String? taskName;
  String? description;
  String? category;
  allTasks({this.taskName, this.description, this.category});
}

class _todoListState extends State<todoList> {
  List<allTasks> task = [
    allTasks(taskName: 'ds', description: "ds", category: "hi")
  ];
  String selectval = "Education";

  var dropdownValue = 'United Kingdom';
  var name = "Rafid";
  var roll = " 2003014";

  // var info = {"name": name};

  void _showcontent() {
    TextEditingController taskName = TextEditingController();
    TextEditingController taskDescription = TextEditingController();
    //TextEditingController taskName = TextEditingController();
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Add  Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: taskName,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple.shade700),
                        ),
                        hintText: 'Enter Task name'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 400,
                  height: 80,
                  child: TextField(
                    controller: taskDescription,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple.shade700),
                        ),
                        hintText: 'Task Description'),
                  ),
                ),
                // Step 1.

// Step 2.
                DecoratedBox(
                  decoration: BoxDecoration(
                      //background color of dropdown button
                      border: Border.all(
                          color: Colors.purple.shade700,
                          width: 3), //border of dropdown button

                      boxShadow: <BoxShadow>[
                        //apply shadow on Dropdown button
                        BoxShadow(
                            color: Colors.white, //shadow for button
                            blurRadius: 5) //blur radius of shadow
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(border: InputBorder.none),
                      value: selectval,
                      items: [
                        //add items in the dropdown
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Text("Education"),
                              Icon(Icons.school_outlined)
                            ],
                          ),
                          value: "Education",
                        ),
                        DropdownMenuItem(
                            child: Row(
                              children: [
                                Text("Work"),
                                Icon(Icons.work_outline_sharp)
                              ],
                            ),
                            value: "Work"),
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Text("Home"),
                              Icon(Icons.home_max_outlined)
                            ],
                          ),
                          value: "Home",
                        ),
                        DropdownMenuItem(
                          child: Row(
                            children: [
                              Text(
                                "Others",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.topic_outlined)
                            ],
                          ),
                          value: "Others",
                        )
                      ],
                      onSaved: (value) {
                        //get value when changed
                        // print("You have selected $value");
                        setState(() {
                          selectval = value.toString();
                        });
                        // print(selectval);
                      },
                      onChanged: (value) {
                        //get value when changed
                        // print("You have selected $value");
                        setState(() {
                          selectval = value.toString();
                        });
                        //print(selectval);
                      },
                      //dropdown background color
                      // underline: Container(), //remove underline
                      isExpanded: true, //make
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
                backgroundColor: Colors.red.shade700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  print(taskName.text);
                  print(taskDescription.text);
                  print(selectval);
                  task.add(allTasks(
                      taskName: taskName.text,
                      description: taskDescription.text,
                      category: selectval));
                  Navigator.of(context).pop();
                  print(task.length);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  backgroundColor: Colors.purple.shade700,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  var todolist = "fdfd";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: todolist.length == 0
              ? Center(
                  child: Text(
                    'No task found',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(children: <Widget>[
                    Text("hello"),
                    for (var t in task) taskList()
                  ])),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                _showcontent();
              },
              tooltip: 'Add  Task',
              backgroundColor: Colors.purple[700],
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        )
      ],
    );
  }
}
