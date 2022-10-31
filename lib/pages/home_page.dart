// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/dialogue_box.dart';
import '../component/my_alert_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//refrence the hive box
  final _mybox = Hive.box('mybox');
  //text controller
  final _controller = TextEditingController();
//list of todo Task
  ToDoDatabase db = ToDoDatabase();

  //init state
  @override
  void initState() {
    //if this is first time opening app
    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      //already data
      db.loadData();
    }
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

//checkbox method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

//newtask save method
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

//create task
  // ignore: non_constant_identifier_names
  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: _controller,
          onsave: saveNewTask,
          cancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
  //edit task
  // open habit settings to edit
  void EditTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _controller,
          hintText: db.todoList[index][0],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }
  void cancelDialogBox() {
    // clear textfield
    _controller.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }
  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todoList[index][0] = _controller.text;
    });
    _controller.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 204, 131),
      appBar: AppBar(
        title: const Center(child: Text('Todo App By Waqar')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: sort_child_properties_last
        child: Icon(Icons.add),
        onPressed: CreateNewTask,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskNAme: db.todoList[index][0],
            taskcompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            EditTask: (context)=>EditTask(index),
          );
        },
      ),
    );
  }
}
