import 'package:flutter/material.dart';
import '../../controllers/task_controller copy.dart';
import '../../models/task.dart';
import '../../controllers/task_controller.dart';
import '../../utils/app_theme.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final int index;
  final TaskController taskController;
  
  const TaskItem({
    Key? key, 
    required this.task, 
    required this.index,
    required this.taskController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'task-${task.id}-${task.createdAt.millisecondsSinceEpoch}',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Dismissible(
          key: Key(task.id.toString()),
          background: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (_) => taskController.deleteTask(index),
          child: Card(
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: task.isCompleted,
                  activeColor: AppTheme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  onChanged: (_) {
                    taskController.toggleTaskStatus(index);
                  },
                ),
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: task.isCompleted ? FontWeight.normal : FontWeight.w600,
                  decoration: task.isCompleted 
                    ? TextDecoration.lineThrough 
                    : TextDecoration.none,
                  color: task.isCompleted ? Colors.grey : Colors.black87,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.red.shade300,
                ),
                onPressed: () => taskController.deleteTask(index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}