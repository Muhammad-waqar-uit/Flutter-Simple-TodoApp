import 'package:hive/hive.dart';

class ToDoDatabase {
//list
  List todoList = [];

  //reference the box
  final _mybox = Hive.box('mybox');
//run this method for first time openning app
  void createInitialData() {
    todoList = [
      ['Hello User!', false]
    ];
  }

  //load data from db
  void loadData() {
    todoList = _mybox.get('TODOLIST');
  }

  //update database
  void updateDatabase() {
    _mybox.put('TODOLIST', todoList);
  }
}
