// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskNAme;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  final Function(BuildContext)? EditTask;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.EditTask,
    required this.taskNAme,
    required this.taskcompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25,bottom: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
            ),
            SlidableAction(
              icon: Icons.edit,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
              onPressed: EditTask,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //check box
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              //task name
              Flexible(
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  taskNAme,
                  style: TextStyle(
                      decoration: taskcompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
