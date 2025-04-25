import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/task_controller copy.dart';
import '../../controllers/task_controller.dart';
import '../widgets/task_stats.dart';
import '../widgets/filter_section.dart';
import '../widgets/task_item.dart';
import '../widgets/empty_state.dart';
import '../../utils/app_theme.dart';

class TaskListScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text('My Tasks'),
      ),
      body: Column(
        children: [
          TaskStats(taskController: taskController),
          _buildAddTaskSection(),
          FilterSection(taskController: taskController),
          _buildTaskList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  
  Widget _buildAddTaskSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Enter task title',
                prefixIcon: Icon(Icons.task, color: AppTheme.primaryColor),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              taskController.addTask(textController.text);
              textController.clear();
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
  
  Widget _buildTaskList() {
    return Expanded(
      child: Obx(() => taskController.filteredTasks.isEmpty
        ? EmptyState()
        : ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: taskController.filteredTasks.length,
            itemBuilder: (context, index) {
              return TaskItem(
                task: taskController.filteredTasks[index],
                index: index,
                taskController: taskController,
              );
            },
          ),
      ),
    );
  }
  
  void _showAddTaskDialog(BuildContext context) {
    final dialogTextController = TextEditingController();
    
    Get.dialog(
      AlertDialog(
        title: Text('Add New Task'),
        content: TextField(
          controller: dialogTextController,
          decoration: InputDecoration(
            hintText: 'Task title',
            prefixIcon: Icon(Icons.assignment),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              if (dialogTextController.text.isNotEmpty) {
                taskController.addTask(dialogTextController.text);
                Get.back();
              }
            },
            child: Text('Add Task'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}