import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/db/objectbox.dart';


import 'utils/app_theme.dart';
import 'views/screens/task_list_screen.dart';


/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize ObjectBox
  objectbox = await ObjectBox.create();
  
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Manager',
      theme: AppTheme.lightTheme,
      home: TaskListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}