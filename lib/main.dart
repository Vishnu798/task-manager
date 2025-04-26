import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/theme_controller.dart';
import 'db/objectbox.dart';
import 'utils/app_theme.dart';
import 'views/screens/task_list_screen.dart';


/// Provides access to the ObjectBox Store throughout the app.
late ObjectBox objectbox;

Future<void> main() async {
  // This is required so ObjectBox can get the application directory
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize ObjectBox
  objectbox = await ObjectBox.create();
  
  // Initialize GetStorage for theme persistence
  await GetStorage.init();
  
  runApp(TaskApp());
}

class TaskApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  
  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(
      title: 'Task Manager',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.themeMode,
      home: TaskListScreen(),
      debugShowCheckedModeBanner: false,
    ));
  }
}