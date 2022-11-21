import 'package:flutter/material.dart';
import 'package:local_storage/hive/dialogbox.dart';
import 'package:local_storage/hive/todotile.dart';

class HiveLocal extends StatefulWidget {
  const HiveLocal({super.key});

  @override
  State<HiveLocal> createState() => _HiveLocalState();
}

class _HiveLocalState extends State<HiveLocal> {
  List toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false]
  ];

  // checkbox control
  void checkboxControl(bool? value, int? index) {
    setState(() {
      toDoList[index!][1] = !toDoList[index][1];
    });
  }

  void createNewNotes() {
    showDialog(
        context: context,
        builder: ((context) {
          return DialogBox(

          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('Hive Local')),
        elevation: 0,
      ),
      // body: ListView(
      //     children: [
      //     ToDoTile(
      //       taskName: 'Make Tutorial',
      //       taskCompleted: true,
      //       onChanged: (p0) => ,
      //     ),
      //     ToDoTile(
      //       taskName: 'Do Exercise',
      //       taskCompleted: false,
      //       onChanged: (p0) => ,
      //     ),
      //     ToDoTile(
      //       taskName: 'Make Tutorial',
      //       taskCompleted: true,
      //       onChanged: (p0) => ,
      //     ),
      //     ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => createNewNotes(),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkboxControl(value, index));
        },
      ),
    );
  }
}
