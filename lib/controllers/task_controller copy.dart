import 'package:get/get.dart';
import '../models/task.dart';
import '../main.dart'; // To access objectbox

class TaskController extends GetxController {
  var tasks = <Task>[].obs;
  var filter = 'All'.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Load tasks from ObjectBox when controller initializes
    loadTasks();
  }
  
  void loadTasks() {
    final storedTasks = objectbox.getAllTasks();
    tasks.assignAll(storedTasks);
    _sortTasks();
    tasks.refresh();
  }
  
  void _sortTasks() {
    tasks.sort((a, b) => a.isCompleted ? 1 : -1);
  }
  
  List<Task> get filteredTasks {
    if (filter.value == 'All') return tasks;
    if (filter.value == 'Active') return tasks.where((task) => !task.isCompleted).toList();
    return tasks.where((task) => task.isCompleted).toList();
  }
  
  void addTask(String title) {
    if (title.isNotEmpty) {
      final task = Task(title: title.trim());
      final id = objectbox.addTask(task);
      task.id = id;
      tasks.add(task);
      _sortTasks();
      tasks.refresh();
    }
  }
  
  void toggleTaskStatus(int index) {
    final task = filteredTasks[index];
    final mainIndex = tasks.indexWhere((t) => t.id == task.id);
    if (mainIndex != -1) {
      tasks[mainIndex].isCompleted = !tasks[mainIndex].isCompleted;
      // Update in ObjectBox
      objectbox.updateTask(tasks[mainIndex]);
      _sortTasks();
      tasks.refresh();
    }
  }
  
  void deleteTask(int index) {
    final task = filteredTasks[index];
    // Remove from ObjectBox
    if (task.id > 0) {
      objectbox.removeTask(task.id);
    }
    tasks.removeWhere((t) => t.id == task.id);
    tasks.refresh();
  }
  
  void changeFilter(String filterName) {
    filter.value = filterName;
  }
  
  int get completedCount => tasks.where((task) => task.isCompleted).length;
  int get activeCount => tasks.length - completedCount;
}