import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  // const ToDo({super.key})
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('A simple ToDO app'),
  //     ),
  //   );
  // }
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

class _todoListState extends State<todoList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: Center(
          child: Text('How are you?'),
        )),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {},
              tooltip: 'Add New Task',
              backgroundColor: Colors.purple[700],
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        )
      ],
    );
  }
}
