import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'notification.dart';

DateTime scheduleTime = DateTime.now();

class tasklist extends StatelessWidget {
  dynamic taskName;
  dynamic description;
  dynamic category;
  tasklist({this.taskName, this.description, this.category});

  @override
  Widget build(BuildContext context) {
    late final NotificationService notificationService;
    @override
    void initState() {
      notificationService = NotificationService();
      //listenToNotificationStream();
      notificationService.initializePlatformNotifications();
      // this.initState();
    }

    // void listenToNotificationStream() =>
    //     notificationService.behaviorSubject.listen((payload) {
    //       Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => MySecondScreen(payload: payload)));
    //     });

    void _showPopUpMenu(Offset offset) async {
      await showMenu(
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy, 0, 0),
        items: [
          PopupMenuItem(
            child: TextButton(
              onPressed: () {
                DatePicker.showDateTimePicker(
                  context,
                  showTitleActions: true,
                  onChanged: (date) => scheduleTime = date,
                  onConfirm: (date) {
                    print(date);
                  },
                );
              },
              child: const Text(
                'Set Reminder',
                style: TextStyle(color: Colors.black),
              ),
            ),
            value: 1,
          ),
          PopupMenuItem(
            child: TextButton(
              onPressed: () async {
                initState();
                print("clicked");
                await notificationService.showLocalNotification(
                    id: 0,
                    title: "$taskName",
                    body: "$description",
                    payload: "You just completed your work! Huurray!");
                print("clicked2");
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.black),
              ),
            ),
            value: 2,
          ),
          PopupMenuItem(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.black),
              ),
            ),
            value: 3,
          ),
        ],
        elevation: 8,
      ).then((value) {
        if (value != null) print(value);
      });
    }

    Color taskColor = Colors.blue.shade600;
    var taskTag = category;
    if (taskTag == 'Work') {
      taskColor = Colors.deepPurple;
    } else if (taskTag == 'Home') {
      taskColor = Colors.deepOrange.shade600;
    } else
      taskColor = Colors.amber.shade600;
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
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            taskName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Wrap(
                          children: [
                            Text(description),
                          ],
                        ),
                        Center(
                            child: Text(
                          "Type : $category",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ))
                      ],
                    ),
                  ),
                  new Spacer(),
                  GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        _showPopUpMenu(details.globalPosition);
                      },
                      child: Icon(
                        Icons.more_vert,
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
